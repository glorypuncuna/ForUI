import 'package:flutter/material.dart';

import 'package:forui/shared/customcolors.dart';

class CustomButton extends StatelessWidget {
  final text, action;

  CustomButton(
    this.text,
    this.action,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      child: RaisedButton(
        color: customBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        onPressed: action,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtonAlt extends StatelessWidget {
  final text, action;

  CustomButtonAlt(
    this.text,
    this.action,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Text(
            text,
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
      ),
      onTap: action,
    );
  }
}
