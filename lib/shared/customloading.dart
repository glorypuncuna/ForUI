import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:forui/shared/custombackground.dart';
import 'package:forui/shared/customcolors.dart';

class CustomLoading extends StatefulWidget {
  final darkTheme;

  CustomLoading(this.darkTheme);

  @override
  _CustomLoadingState createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomBackground(widget.darkTheme),
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
