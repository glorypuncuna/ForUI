import 'package:flutter/material.dart';

import 'package:forui/shared/customcolors.dart';

class CustomTextField extends StatelessWidget {
  final text, action, showEmailKeyboard, controller;

  CustomTextField(
    this.text, {
    this.action,
    this.controller,
    this.showEmailKeyboard,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: customBlue),
        ),
        hintText: text,
      ),
      keyboardType: showEmailKeyboard,
      maxLines: null,
      onChanged: action,
      validator: (val) => (val.isEmpty) ? text + ' tidak boleh kosong.' : null,
    );
  }
}
