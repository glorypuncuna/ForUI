import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forui/shared/custombackground.dart';
import 'package:forui/shared/customcolors.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackground(),
        Center(
          child: SpinKitWanderingCubes(
            color: customBlue,
            size: 64,
          ),
        ),
      ],
    );
  }
}
