import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:forui/models/user.dart';
import 'package:forui/screens/wrapper.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/shared/customcolors.dart';

bool isDarkTheme = false;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            color: isDarkTheme ? Colors.grey[900] : Colors.white,
            iconTheme: IconThemeData(
              color: isDarkTheme ? Colors.white : Colors.grey,
            ),
          ),
          accentColor: customBlue,
          brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          primaryColor: Colors.white,
          primaryTextTheme: isDarkTheme
              ? Typography.whiteMountainView
              : Typography.blackMountainView,
        ),
      ),
    );
  }
}
