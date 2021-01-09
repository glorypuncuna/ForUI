import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final text, color, action, showEmailKeyboard;

  CustomTextField(
    this.text,
    this.color,
    this.action, {
    this.showEmailKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: color,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: color),
        ),
        hintText: text,
      ),
      keyboardType: showEmailKeyboard,
      onChanged: action,
      validator: (val) => (val.isEmpty) ? text + ' tidak boleh kosong.' : null,
    );
  }
}
