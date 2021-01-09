import 'package:flutter/material.dart';

import 'package:forui/screens/forum/mainForum.dart';

class Forum extends StatefulWidget {
  @override
  _ForumState createState() => _ForumState();
}

TextEditingController namaLombaController = TextEditingController();
TextEditingController judulDiskusiController = TextEditingController();
TextEditingController isiDiskusiController = TextEditingController();

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Create Team"),
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
                  child: namaLomba(),
                ),
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

TextFormField namaLomba() {
  return TextFormField(
    controller: namaLombaController,
    textCapitalization: TextCapitalization.sentences,
    maxLength: 15,
    maxLengthEnforced: true,
    decoration: const InputDecoration(
      fillColor: Colors.grey,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText: 'Tulis nama lomba yang ingin kamu ikuti',
      labelText: 'Nama Lomba',
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

TextFormField judulDiskusi() {
  return TextFormField(
    controller: judulDiskusiController,
    textCapitalization: TextCapitalization.sentences,
    maxLength: 70,
    maxLines: 3,
    decoration: const InputDecoration(
      fillColor: Colors.grey,
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
      fillColor: Colors.grey,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText:
          'Tulis deskripsi dari diskusi yang ingin kamu mulai, kamu dapat menambahan kriteria member tim yang kamu inginkan',
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
        MaterialPageRoute(builder: (context) => ForumDiscussion()),
      );
    },
  );
}
