import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:forui/screens/forum/alerRecruitment.dart';
import 'package:forui/models/user.dart';
import 'package:forui/services/database.dart';

class AnonymProfile extends StatefulWidget {
  @override
  _AnonymProfileState createState() => _AnonymProfileState();
}

class _AnonymProfileState extends State<AnonymProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            "Anonymous Profile",
            style: TextStyle(color: Colors.black),
          ),
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
              Row(
                children: [
                  Icon(
                    Icons.person,
                    size: 100,
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('Jidan',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        child: recruitment(context),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                padding:
                    EdgeInsets.only(top: 30, left: 20, right: 10, bottom: 10),
                child: Text('Profil',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                    )),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(20),
                child: Text('Teknik Komputer 2018 - Programmer',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

RaisedButton recruitment(BuildContext context) {
  final user = Provider.of<User>(context);
  return RaisedButton(
    padding: const EdgeInsets.all(20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11),
      side: BorderSide(color: Colors.black),
    ),
    child: Text(
      'Recruit',
      style: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    color: Colors.green,
    splashColor: Colors.lightGreen,
    onPressed: () {
      DatabaseService(uid: user.uid).send();
      showAlertDialogR(context);
    },
  );
}
