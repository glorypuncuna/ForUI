import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:forui/models/user.dart';
import 'package:forui/screens/authenticate/authenticate.dart';
import 'package:forui/screens/home/home.dart';

class Wrapper extends StatefulWidget {
  final darkTheme, toggleTheme;

  Wrapper(this.darkTheme, this.toggleTheme);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate(widget.darkTheme);
    } else {
      return Home(widget.darkTheme, widget.toggleTheme);
    }
  }
}
