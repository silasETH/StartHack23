import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit_example/vision_detector_views/camera_view.dart';
import 'package:google_ml_kit_example/vision_detector_views/text_view.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
              )),
              Tab(
                  icon: Icon(
                Icons.text_fields_outlined,
                color: Colors.black,
              )),
            ],
          ),
          title: const Text(
            'Sperrgut-Scanner St. Gallen',
            style: TextStyle(
              fontSize: 18.0,
              color: Color(0xFF1A1B1E),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          leading: const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Image(image: AssetImage('assets/img/logo_sg.png')),
          ),
          backgroundColor: Colors.white,
          actions: [],
          // bottom: PreferredSize(
          //   preferredSize: const Size.fromHeight(4.0),
          //   child: Container(
          //     color: Color(0xFFE00025),
          //     height: 2.0,
          //   ),
          // ),
        ),
        body: TabBarView(
          children: [
            CameraView(
              title: 'Sperrgut-Scanner',
              customPaint: _customPaint,
              onImage: (inputImage) {
                processImage(inputImage);
              },
            ),
            TextView(),
          ],
        ),
      ),
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    final recognizedText = await _textRecognizer.processImage(inputImage);
    List<int> code = recognizedText.text
        .replaceAll(' ', '')
        .codeUnits
        .map((e) => e - 48)
        .toList();
    if (code.length == 6 &&
        code.every((e) => e >= 0 && e < 10) &&
        CartItem.isCodeValid(code)) {
      selectedCode = code;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ConfirmationScreen()));
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}

List<int> selectedCode = [];

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartItemText itemText = CartItemText();
    if (CartItem.isCodeValid(selectedCode)) {
      CartItem item = CartItem.codeToItem(selectedCode);
      itemText = CartItemText.CartItemToText(item);
    }

    return Material(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromRGBO(0, 179, 60, 1),
                Color.fromRGBO(0, 102, 34, 1),
              ],
            )),
            // color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(height: 1),
                  Container(
                      child: Column(children: [
                    Text(
                      itemText.stamps ?? "3",
                      style: TextStyle(fontSize: 100, color: Colors.white),
                    ),
                    SizedBox(height: 24),
                    Text(
                      itemText.title ?? "Marken",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(height: 18),
                    Text(
                      itemText.first ?? "",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(height: 4),
                    Text(
                      itemText.second ?? "",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ])),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 50,
                    child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context)
                              .popUntil((route) => route.isFirst);
                          ;
                        },
                        color: Colors.white,
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        )),
                  )
                ],
              ),
            )));
  }
}

enum CartItemType {
  undefined,
  sofa,
  mattress,
  other,
  trashBag,
}

class CartItem {
  CartItemType type = CartItemType.undefined;
  bool bigItem = false;
  int weightClass = 0;
  List<int> code = [];

  int get stampCount => weightClass + (bigItem ? 2 : 1);

  static final List<int> forbiddenToSanitized = [0, 2, 5, 6, 7, 8];
  static final List<int> sanitizedToForbidden = [0, 0, 1, 0, 0, 2, 3, 4, 5, 0];
  static final List<int> numberPair = [3, 2, 1, 0, 5, 4];
  static final List<bool> forbidden = [
    false,
    true,
    false,
    true,
    true,
    false,
    false,
    false,
    false,
    true
  ];

  static List<int> itemToCode(CartItem item) {
    List<int> result = [
      item.type.index,
      item.bigItem ? 1 : 0,
      item.weightClass
    ];
    result = result
        .expand((e) => [e, numberPair[e]])
        .map((e) => forbiddenToSanitized[e])
        .toList();
    return result;
  }

  static List<int> itemToRandomCode(CartItem item) {
    final random = Random();
    List<int> result = [
      item.type.index,
      item.bigItem ? 1 : 0,
      item.weightClass
    ];
    result[1] += random.nextInt(3) * 2;
    result[2] += random.nextInt(2) * 3;
    result = result
        .expand((e) => [e, numberPair[e]])
        .map((e) => forbiddenToSanitized[e])
        .toList();
    return result;
  }

  static bool isCodeValid(List<int> code) {
    if (code.length != 6) {
      return false;
    }
    if (code.any((e) => e < 0 && e >= 10)) {
      return false;
    }
    if (code.any((e) => forbidden[e])) {
      return false;
    }
    code = code.map((e) => sanitizedToForbidden[e]).toList();
    for (int i = 0; i < 6; i += 2) {
      if (code[i] != numberPair[code[i + 1]]) {
        return false;
      }
    }
    return true;
  }

  static CartItem codeToItem(List<int> code) {
    assert(isCodeValid(code));
    code = code.map((e) => sanitizedToForbidden[e]).toList();
    CartItem result = CartItem();
    result.type = CartItemType.values[code[0] % 5];
    result.bigItem = (code[2] % 2) == 0 ? false : true;
    result.weightClass = code[4] % 3;
    result.code = code;
    return result;
  }

  String codeAsString() {
    return "${code[0]}${code[1]}${code[2]} ${code[3]}${code[4]}${code[5]}";
  }
}

class CartItemText {
  String? title;
  String? first;
  String? second;
  String? stamps;
  String? code;

  static CartItemToText(CartItem cartItem) {
    CartItemText cartItemText = CartItemText();

    cartItemText.stamps = cartItem.stampCount.toString();
    cartItemText.code = cartItem.codeAsString();

    switch (cartItem.type) {
      case CartItemType.sofa:
        {
          cartItemText.title = "Sofa";
          cartItemText.first = cartItem.bigItem
              ? "3 oder mehr Sitzplätze"
              : "bis zu 2 Sitzplätze";
          break;
        }

      case CartItemType.mattress:
        {
          cartItemText.title = "Matratze";
          cartItemText.first = cartItem.bigItem ? "Doppelt" : "Einzel";
          break;
        }

      case CartItemType.trashBag:
        {
          cartItemText.title = "Inoffizieller Abfallsack";
          break;
        }

      default:
        {
          cartItemText.title = "Sperrmüll";
          cartItemText.first = cartItem.bigItem ? "Übergrösse" : "Normalgrösse";
          switch (cartItem.weightClass) {
            case 0:
              {
                cartItemText.second = "Weniger als 30kg";
                break;
              }
            case 1:
              {
                cartItemText.second = "Zwischen 30kg und 60kg";
                break;
              }
            default:
              {
                cartItemText.second = "Mehr als 60kg";
                break;
              }
          }
          break;
        }
    }

    return cartItemText;
  }
}
