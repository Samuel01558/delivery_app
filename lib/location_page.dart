import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationIntegrationPage extends StatefulWidget {
  const LocationIntegrationPage({super.key});

  @override
  _LocationIntegrationPageState createState() => _LocationIntegrationPageState();
}

class _LocationIntegrationPageState extends State<LocationIntegrationPage> {
  final Set<Marker> _markers = {};
  bool _isLoading = true;
  String? _errorMessage;
  Position? _currentPosition;
  LatLng? _center;
  List<dynamic> _places = [];

  @override
  void initState() {
    super.initState();
    _fetchLocationAndPlaces();
  }

  // Fetch the current location and nearby places
  void _fetchLocationAndPlaces() async {
    try {
      // Get current position
      _currentPosition = await _determinePosition();
      _center = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);

      // Fetch nearby places based on the current location
      await _fetchNearbyPlaces(_currentPosition!.latitude, _currentPosition!.longitude);

      // Add markers to the map
      _addMarkers();

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Error: $e';
      });
    }
  }

  // Determine the current position using Geolocator
  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        throw Exception('Location permission denied');
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  // Fetch nearby places using Google Places API
  Future<void> _fetchNearbyPlaces(double lat, double lng) async {
    final String apiKey = 'YOUR_GOOGLE_API_KEY'; // Replace with your actual API key
    final String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&radius=1500&type=restaurant&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _places = data['results'];
        });
      } else {
        throw Exception('Failed to load places');
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error fetching places: $e';
      });
    }
  }

  // Add markers for current location and places
  void _addMarkers() {
    setState(() {
      _markers.clear();
      if (_currentPosition != null) {
        _markers.add(Marker(
          markerId: MarkerId('current_location'),
          position: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          infoWindow: InfoWindow(title: 'Current Location'),
        ));
      }

      // Add markers for nearby places
      for (var place in _places) {
        _markers.add(Marker(
          markerId: MarkerId(place['place_id']),
          position: LatLng(place['geometry']['location']['lat'], place['geometry']['location']['lng']),
          infoWindow: InfoWindow(title: place['name'], snippet: place['vicinity']),
        ));
      }
    });
  }

  // Called when the map is created
  void _onMapCreated(GoogleMapController controller) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Integration'),
        backgroundColor: Colors.blue,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _center ?? LatLng(0, 0), // Default value if _center is null
                    zoom: 15.0,
                  ),
                  markers: _markers,
                  onMapCreated: _onMapCreated,
                ),
    );
  }
}
