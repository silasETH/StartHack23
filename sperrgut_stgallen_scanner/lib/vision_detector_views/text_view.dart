import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  final Function(String) onSubmitted;

  TextView({required this.onSubmitted});

  @override
  State<StatefulWidget> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 20),
        controller: _controller,
        keyboardType: TextInputType.number,
        onSubmitted: widget.onSubmitted,
        cursorColor: Color(0xFFE00025),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE00025)),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE00025)),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE00025)),
          ),
        ),
      ),
    );
  }
}
