import 'package:flutter/material.dart';
import 'formForum.dart';
import 'mainForum.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Forum(),
      title: 'Forum',
      routes: <String, WidgetBuilder>{
        '/formForum': (BuildContext context) => Forum(),
        '/forum': (BuildContext context) => ForumDiscussion(),
      },
    );
  }
}
