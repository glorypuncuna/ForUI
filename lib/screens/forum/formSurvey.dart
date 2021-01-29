import 'package:flutter/material.dart';
import 'package:forui/screens/forum/surveyForum.dart';

class FormSurvey extends StatefulWidget {
  @override
  _FormSurveyState createState() => _FormSurveyState();
}

TextEditingController judulSurveyController = TextEditingController();
TextEditingController linkController = TextEditingController();
TextEditingController penjelasanSurveyController = TextEditingController();

class _FormSurveyState extends State<FormSurvey> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "Create Survey",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.all(15.0),
                  child: judulSurvey(),
                ),
                Container(
                  padding: new EdgeInsets.all(15.0),
                  child: link(),
                ),
                Container(
                  padding: new EdgeInsets.all(15.0),
                  child: penjelasanSurvey(),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  padding: new EdgeInsets.all(15.0),
                  child: tombolKirim(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TextFormField judulSurvey() {
  return TextFormField(
    controller: judulSurveyController,
    textCapitalization: TextCapitalization.sentences,
    maxLength: 15,
    maxLengthEnforced: true,
    decoration: const InputDecoration(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText: 'Tulis nama judul survey milikmu',
      labelText: 'Judul Survey',
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

TextFormField link() {
  return TextFormField(
    controller: linkController,
    textCapitalization: TextCapitalization.sentences,
    maxLength: 70,
    maxLines: 3,
    decoration: const InputDecoration(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText: 'Silahkan taruh link survey disini',
      labelText: 'Link Survey',
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

TextFormField penjelasanSurvey() {
  return TextFormField(
    controller: penjelasanSurveyController,
    textCapitalization: TextCapitalization.sentences,
    keyboardType: TextInputType.multiline,
    maxLength: 300,
    maxLines: 10,
    decoration: const InputDecoration(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText: 'Tulis deskripsi dari survey yang kamu lakukan',
      labelText: 'Deskripsi',
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

RaisedButton tombolKirim(BuildContext context) {
  return RaisedButton(
    padding: const EdgeInsets.all(20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11),
      side: BorderSide(color: Colors.white60),
    ),
    child: Text(
      'Submit',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    color: Colors.black,
    splashColor: Colors.grey,
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SurveyForum()),
      );
    },
  );
}
