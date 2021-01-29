import 'package:flutter/material.dart';
import 'package:forui/screens/home/home.dart';
import 'formForum.dart';
import 'replyWidget.dart';
import 'replyForm.dart';

class ForumDiscussion extends StatefulWidget {
  @override
  _ForumDiscussionState createState() => _ForumDiscussionState();
}

class _ForumDiscussionState extends State<ForumDiscussion> {
  List<String> isiDiskusiList = [];
  int reply = 0;
  int answer = 0;
  final String pemicuDiskusi =
      '[' + namaLombaController.text + '] ' + judulDiskusiController.text;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          "Recruit Member",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()))),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            judulForum(pemicuDiskusi),
            boxPertanyaan(replyFormHandler),
            if (reply == 0)
              Center(
                child: Container(
                  margin: EdgeInsets.all(50),
                  child: Text('Belum Ada Balasan',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                ),
              )
            else if (answer % 2 == 1)
              replyForm(answerFormHandler),
            if (isiDiskusiList.length != 0)
              Container(
                child: Column(
                  children: [
                    for (String isi in isiDiskusiList) BalasDiskusi(isi)
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[900],
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.chat_bubble,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.chat_bubble_outline_outlined,
              color: Colors.white,
            ),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  void replyFormHandler() {
    setState(() {
      reply = reply + 1;
      answer = answer + 1;
    });
  }

  void answerFormHandler() {
    setState(() {
      answer = answer + 1;
      isiDiskusiList.add(isiBalasanController.text);
      isiBalasanController.clear();
    });
  }
}

Wrap judulForum(String context) {
  return Wrap(children: [
    Container(
      margin: new EdgeInsets.only(top: 10, left: 15, right: 15),
      padding: new EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Text(
          context,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ]);
}

Wrap boxPertanyaan(Function handler) {
  return Wrap(children: [
    Container(
      margin: new EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
      padding: new EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                size: 35,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jidan',
                    textAlign: TextAlign.left,
                  ),
                  waktu(),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 10),
            child: Text(isiDiskusiController.text, textAlign: TextAlign.left),
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              color: Colors.white54,
              child:
                  Text("Reply", style: TextStyle(fontWeight: FontWeight.w600)),
              onPressed: handler,
            ),
          ),
        ],
      ),
    ),
  ]);
}

Row waktu() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(right: 80),
        child: Text(
          '11 Januari 2021',
          style: styleWaktu,
        ),
      ),
      Container(
        child: Text(
          '',
          style: styleWaktu,
          textAlign: TextAlign.right,
        ),
      ),
    ],
  );
}

final styleWaktu = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w300,
);
