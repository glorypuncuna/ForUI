import 'package:flutter/material.dart';

class CustomBackground extends StatefulWidget {
  final darkTheme;

  CustomBackground(this.darkTheme);

  @override
  _CustomBackgroundState createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/background_ui.jpg',
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Opacity(
          opacity: widget.darkTheme ? 1 : 0.95,
          child: Container(
            color: widget.darkTheme ? Colors.grey[900] : Colors.white,
          ),
        ),
      ],
    );
  }
}
