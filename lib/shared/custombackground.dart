import 'package:flutter/material.dart';

import 'package:forui/main.dart';

class CustomBackground extends StatelessWidget {
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
          opacity: isDarkTheme ? 1 : 0.9,
          child: Container(
            color: isDarkTheme ? Colors.grey[900] : Colors.white,
          ),
        ),
      ],
    );
  }
}
