import 'package:flutter/material.dart';
import 'package:forui/screens/home/home.dart';

class AlertRec extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: showAlertDialogR(context),
    );
  }
}

showAlertDialogR(BuildContext context) {
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Permintaan Terkirim!"),
    content: Text("Anda tinggal menunggu jawaban dari calon tim anda"),
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
