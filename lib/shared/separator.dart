import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final double size;

  Separator(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}
