import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final hintText, validatorText, keyboardType, obscureText, action;

  CustomTextField(
    this.hintText,
    this.validatorText,
    this.keyboardType,
    this.obscureText,
    this.action,
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: action,
      validator: (val) => (val.isEmpty) ? validatorText : null,
    );
  }
}
