import 'package:flutter/material.dart';

class CustomSeparator extends StatelessWidget {
  final double size;

  CustomSeparator(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
