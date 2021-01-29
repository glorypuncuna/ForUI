import 'package:flutter/material.dart';
import 'package:forui/screens/forum/discussionForum.dart';

class FormDiscussion extends StatefulWidget {
  @override
  _FormDiscussionState createState() => _FormDiscussionState();
}

TextEditingController judulDiskusiController = TextEditingController();
TextEditingController isiDiskusiController = TextEditingController();

class _FormDiscussionState extends State<FormDiscussion> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title:
              Text("Create Discussion", style: TextStyle(color: Colors.black)),
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
                  child: judulDiskusi(),
                ),
                Container(
                  padding: new EdgeInsets.all(15.0),
                  child: isiDiskusi(),
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

TextFormField judulDiskusi() {
  return TextFormField(
    controller: judulDiskusiController,
    textCapitalization: TextCapitalization.sentences,
    maxLength: 70,
    maxLines: 3,
    decoration: const InputDecoration(
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText: 'Tulis judul diskusi atau pertanyaan',
      labelText: 'Judul Diskusi',
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

TextFormField isiDiskusi() {
  return TextFormField(
    controller: isiDiskusiController,
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
      hintText:
          'Tulis deskripsi dari diskusi yang ingin kamu mulai, kamu dapat menuliskan pemicu dari diskusi yang ingin dimulai',
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
        MaterialPageRoute(builder: (context) => DiscussionForum()),
      );
    },
  );
}
