import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
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
          opacity: 0.8,
          child: Container(
            color: Colors.white,
            child: Center(
              child: SpinKitWanderingCubes(
                color: Colors.blue,
                size: 64,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
