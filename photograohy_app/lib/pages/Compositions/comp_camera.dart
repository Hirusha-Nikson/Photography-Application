import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photograohy_app/pages/Compositions/bottom_navbar.dart';

class Compositon extends StatefulWidget {
  const Compositon({Key? key}) : super(key: key);

  @override
  State<Compositon> createState() => _CompositonState();
}

class _CompositonState extends State<Compositon> {
  int _selectedIndex = 0;
  List<String> _imagePaths = [
    'assets/Rule3rd.png',
    'assets/GoldenSQR1.png',
    'assets/gridrule2.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _nextImage() {
    setState(() {
      if (_selectedIndex < _imagePaths.length - 1) {
        _selectedIndex++;
      }
    });
  }

  void _previousImage() {
    setState(() {
      if (_selectedIndex > 0) {
        _selectedIndex--;
      }
    });
  }

  late List<CameraDescription> cameras;
  late CameraController cameraController;
  bool isCameraInitialized = false;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();

    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
    );

    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraInitialized = true;
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    try {
      final image = await cameraController.takePicture();

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = DateTime.now().toString() + '.png';
      final savedImage =
          await File(image.path).copy('${appDir.path}/$fileName');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image saved to ${savedImage.path}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Compositions"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            CameraPreview(cameraController),
            Image.asset(_imagePaths[_selectedIndex]),
          ],
        ),
        bottomNavigationBar: cameraNavigation(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          onNextPressed: _nextImage,
          onPreviousPressed: _previousImage,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: _captureImage,
          child: Icon(Icons.camera),
        ),
      ),
    );
  }
}
