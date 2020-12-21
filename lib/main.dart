import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:forui/models/user.dart';
import 'package:forui/screens/wrapper.dart';
import 'package:forui/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        theme: ThemeData(primarySwatch: Colors.grey),
      ),
    );
  }
}
