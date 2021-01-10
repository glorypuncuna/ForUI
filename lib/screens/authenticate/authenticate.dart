import 'package:flutter/material.dart';

import 'package:forui/screens/authenticate/register.dart';
import 'package:forui/screens/authenticate/login.dart';

class Authenticate extends StatefulWidget {
  final darkTheme;

  Authenticate(this.darkTheme);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;

  void toggleView() {
    setState(() => showLogin = !showLogin);
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin == true) {
      return Login(widget.darkTheme, toggleView: toggleView);
    } else {
      return Register(widget.darkTheme, toggleView: toggleView);
    }
  }
}
