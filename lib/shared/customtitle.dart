import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  CustomTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        title,
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
