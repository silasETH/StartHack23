import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

import 'vision_detector_views/camera_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextRecognizer _textRecognizer =
      TextRecognizer(script: TextRecognitionScript.chinese);
  bool _canProcess = true;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  int code = 0;

  @override
  void dispose() async {
    _canProcess = false;
    _textRecognizer.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CameraView(
        title: 'Sperrgut-Scanner',
        customPaint: _customPaint,
        onImage: (inputImage) {
          processImage(inputImage);
        },
      ),
      // if (code != 0)
      //   Center(
      //     child: Badge(
      //       label: Text("Recognized code: ${code}"),
      //     ),
      //   )
    ]);
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    final recognizedText = await _textRecognizer.processImage(inputImage);
    if (int.tryParse(recognizedText.text) != null) {
      code = int.parse(recognizedText.text);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Expanded(
              child: Container(
                  color: Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(fontSize: 100, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Marken",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      OutlinedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 5.0, color: Colors.blue),
                          ),
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ))
                    ],
                  )))));
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
