import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:forui/models/user.dart';
import 'package:forui/screens/wrapper.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/shared/customcolors.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool darkTheme = false;

  void toggleTheme(bool value) {
    setState(() {
      darkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          systemNavigationBarColor:
              darkTheme ? Colors.grey[850] : Colors.grey[50],
          systemNavigationBarIconBrightness:
              darkTheme ? Brightness.light : Brightness.dark,
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(darkTheme, toggleTheme),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              brightness: darkTheme ? Brightness.dark : Brightness.light,
              color: darkTheme ? Colors.grey[900] : Colors.white,
              iconTheme: IconThemeData(
                color: darkTheme ? Colors.white : Colors.grey,
              ),
            ),
            accentColor: customBlue,
            brightness: darkTheme ? Brightness.dark : Brightness.light,
            primaryColor: Colors.white,
            primaryTextTheme: darkTheme
                ? Typography.whiteMountainView
                : Typography.blackMountainView,
            toggleButtonsTheme: ToggleButtonsThemeData(color: customBlue),
          ),
        ),
      ),
    );
  }
}
