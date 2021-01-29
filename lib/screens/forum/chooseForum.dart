import 'package:flutter/material.dart';

import 'formDiscussion.dart';
import 'formForum.dart';
import 'formSurvey.dart';

class ChooseForum extends StatefulWidget {
  @override
  _ChooseForumState createState() => _ChooseForumState();
}

class _ChooseForumState extends State<ChooseForum> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Choose Your Discussion", style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: new EdgeInsets.only(
                    top: 100.0, bottom: 15, left: 15, right: 15),
                child: choice(context, 'Recruit Team', Forum()),
              ),
              Container(
                alignment: Alignment.center,
                padding: new EdgeInsets.all(15.0),
                child: choice(context, 'Create Discussion', FormDiscussion()),
              ),
              Container(
                alignment: Alignment.center,
                padding: new EdgeInsets.all(15.0),
                child: choice(context, 'Survey', FormSurvey()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox choice(BuildContext context, String text, Widget forum) {
  return SizedBox(
    width: double.infinity,
    height: 120,
    child: RaisedButton(
      padding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11),
        side: BorderSide(color: Colors.white60),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      color: Colors.black54,
      splashColor: Colors.grey,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => forum),
        );
      },
    ),
  );
}
