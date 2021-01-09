import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final text, action, isBlackFontColor, isBold, isUnderline, color;

  CustomButton(
    this.text,
    this.action,
    this.isBlackFontColor,
    this.isBold,
    this.isUnderline, {
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: color,
        ),
        height: 48,
        width: 128,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isBlackFontColor ? Colors.black : Colors.white,
              decoration: isUnderline ? TextDecoration.underline : null,
              fontWeight: isBold ? FontWeight.bold : null,
            ),
          ),
        ),
      ),
      onTap: action,
    );
  }
}
