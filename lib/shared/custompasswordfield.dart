import 'package:flutter/material.dart';

import 'package:forui/shared/customcolors.dart';

class CustomPasswordField extends StatelessWidget {
  final hintText, action, isRegister, obscureText, toggle, controller;

  CustomPasswordField(this.hintText, this.action, this.isRegister,
      this.obscureText, this.toggle,
      {this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: customBlue),
        ),
        hintText: hintText,
        suffixIcon: InkWell(
          onTap: toggle,
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
      obscureText: obscureText ? obscureText : false,
      onChanged: action,
      validator: isRegister
          ? (val) => (val.length < 8)
              ? 'Masukkan password sepanjang 8 karakter atau lebih.'
              : null
          : (val) => (val.isEmpty) ? 'Password tidak boleh kosong.' : null,
    );
  }
}
