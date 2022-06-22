import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String _hintText;
  final bool _isObscured;
  final TextEditingController _textController;
  const MyTextField(this._hintText, this._isObscured, this._textController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      style: const TextStyle(color: Colors.blue),
      obscureText: _isObscured,
      decoration: InputDecoration(
        hintText: _hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))
      ),
    );
  }
}