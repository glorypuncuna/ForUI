import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:forui/models/user.dart';
import 'package:forui/screens/authenticate/login.dart';
import 'package:forui/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Login();
    } else {
      return Home();
    }
  }
}
