import 'package:flutter/material.dart';
import 'package:forui/screens/forum/formForum.dart';
import 'package:forui/screens/forum/mainForum.dart';
import 'package:provider/provider.dart';
import 'package:forui/screens/wrapper.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/models/user.dart';

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
        routes: <String, WidgetBuilder>{
          '/formForum': (BuildContext context) => Forum(),
          '/forum': (BuildContext context) => ForumDiscussion(),
        },
      ),
    );
  }
}
