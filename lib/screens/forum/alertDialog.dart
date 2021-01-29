import 'package:flutter/material.dart';

import 'mainForum.dart';

class Alert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showAlertDialog(context),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ForumDiscussion()),
      );
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Cara Merekrut Member"),
    content: Text("Tekan profil dari orang yang ingin kamu rekrut"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
