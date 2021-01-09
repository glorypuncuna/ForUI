import 'package:flutter/material.dart';

class CustomPasswordField extends StatelessWidget {
  final hintText, color, action, isRegister, obscureText, toggle;

  CustomPasswordField(
    this.hintText,
    this.color,
    this.action,
    this.isRegister,
    this.obscureText,
    this.toggle,
  );

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
        hintText: hintText,
        suffixIcon: InkWell(
          onTap: toggle,
          child: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black45,
          ),
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
