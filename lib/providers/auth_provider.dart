import 'package:flutter/foundation.dart';
import 'package:delivery_app/models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;

  Future<bool> login(String username, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      // Simular llamada a API
      await Future.delayed(const Duration(seconds: 2));
      
      _user = User(
        id: '1',
        username: username,
        email: '$username@example.com',
      );
      
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
