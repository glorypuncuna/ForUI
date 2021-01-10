import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final text, items, action, value;

  CustomDropDown(
    this.text,
    this.items,
    this.action, {
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
      hint: Text(text),
      items: items,
      onChanged: action,
      validator: (val) => (val.isEmpty) ? text + ' tidak boleh kosong.' : null,
      value: value,
    );
  }
}
