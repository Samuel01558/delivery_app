import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:video_player/video_player.dart';

class MediaProcessingPage extends StatefulWidget {
  const MediaProcessingPage({super.key});

  @override
  State<MediaProcessingPage> createState() => _MediaProcessingPageState();
}

class _MediaProcessingPageState extends State<MediaProcessingPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _mediaFile;
  String _processingResult = "";
  VideoPlayerController? _videoController;

  Future<void> _pickMedia(ImageSource source, bool isVideo) async {
    final XFile? pickedFile = isVideo
        ? await _picker.pickVideo(source: source)
        : await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _mediaFile = pickedFile;
        _processingResult = "Processing ${isVideo ? 'video' : 'image'}...";
      });

      // Si es un video, inicializar el reproductor
      if (isVideo) {
        _videoController?.dispose();
        _videoController = VideoPlayerController.file(File(pickedFile.path))
          ..initialize().then((_) {
            setState(() {}); // Refrescar la pantalla para mostrar el reproductor
            _videoController!.play(); // Reproducir automáticamente
          });
      }

      // Simular procesamiento
      await _processMedia();
    }
  }

  Future<void> _processMedia() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _processingResult = "Processing complete!";
    });
  }

  @override
  void dispose() {
    // Liberar recursos del video
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Media Processing"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickMedia(ImageSource.gallery, false),
              icon: const Icon(Icons.image),
              label: const Text("Pick Image"),
            ),
            ElevatedButton.icon(
              onPressed: () => _pickMedia(ImageSource.gallery, true),
              icon: const Icon(Icons.video_library),
              label: const Text("Pick Video"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _mediaFile != null
                  ? Column(
                      children: [
                        _mediaFile!.path.endsWith('.mp4')
                            ? _videoController != null && _videoController!.value.isInitialized
                                ? AspectRatio(
                                    aspectRatio: _videoController!.value.aspectRatio,
                                    child: VideoPlayer(_videoController!),
                                  )
                                : const Text("Loading video...")
                            : Image.file(
                                File(_mediaFile!.path),
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                        const SizedBox(height: 10),
                        Text(
                          _processingResult,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  : const Center(
                      child: Text(
                        "No media selected.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
