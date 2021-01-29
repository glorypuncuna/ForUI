import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:forui/models/user.dart';
import 'package:forui/models/forui.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  //mengambil data user
  getUserByUsername(String username) async {
    return Firestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .getDocuments();
  }

  getUserByEmail(String email) async {
    return Firestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .getDocuments();
  }

  //collection reference
  final CollectionReference foruiCollection =
      Firestore.instance.collection('users');

  final discussionReference = Firestore.instance.collection('discussion');
  final recruitmentReference = Firestore.instance.collection('recruitment');
  final surveyReference = Firestore.instance.collection('survey');

  //menambahkan thread per kategori
  Future<void> addDiscussionThreads(discussionData, String discThread) async {
    Firestore.instance
        .collection('discussion')
        .document('$discThread')
        .setData(discussionData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addRecruitmentThreads(recruitmentData, String recThread) async {
    Firestore.instance
        .collection('recruitment')
        .document('$recThread')
        .setData(recruitmentData)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addSurveyThreads(surveyData, String surThread) async {
    Firestore.instance
        .collection('survey')
        .document('$surThread')
        .setData(surveyData)
        .catchError((e) {
      print(e);
    });
  }

  //mengambil list threads per kategori
  getDiscussionThreads() async {
    return await Firestore.instance
        .collection('discussion')
        .orderBy('time', descending: true)
        .snapshots();
  }

  getRecruitmentThreads(String recDesc) async {
    return await Firestore.instance
        .collection('recruitment')
        .orderBy('time', descending: true)
        .snapshots();
  }

  getSurveyThreads(String surDesc) async {
    return await Firestore.instance
        .collection('survey')
        .orderBy('time', descending: true)
        .snapshots();
  }

  //menambahkan message atau reply ke sebuah thread per kategori
  addDiscussionMessage(String desc, messageMap) async {
    discussionReference
        .document(desc)
        .collection('discussion')
        .document(messageMap['time'].toString())
        .setData(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  addRecruitmentMessage(String desc, messageMap) async {
    recruitmentReference
        .document(desc)
        .collection('recruitment')
        .document(messageMap['time'].toString())
        .setData(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  addSurveyMessage(String desc, messageMap) async {
    surveyReference
        .document(desc)
        .collection('survey')
        .document(messageMap['time'].toString())
        .setData(messageMap)
        .catchError((e) {
      print(e.toString());
    });
  }

  //ambil messages atau repliesnya
  getDiscussionMessage(String desc) async {
    return Firestore.instance
        .collection('discussion')
        .document(desc)
        .collection('discussion')
        .orderBy('time', descending: false)
        .snapshots();
  }

  getRecruitmentMessage(String desc) async {
    return Firestore.instance
        .collection('recruitment')
        .document(desc)
        .collection('recruitment')
        .orderBy('time', descending: false)
        .snapshots();
  }

  getSurveyMessage(String desc) async {
    return Firestore.instance
        .collection('survey')
        .document(desc)
        .collection('survey')
        .orderBy('time', descending: false)
        .snapshots();
  }

  //pas awal registrasi, mengirimkan data yang user input ke database
  Future uploadUserData(
    String email,
    String nama,
    String username,
    String bio,
    String jurusan,
    bool isAnonim,
    String roleAnonim,
    String namaAnonim,
  ) async {
    return await foruiCollection.document(uid).setData({
      'email': email,
      'nama': nama,
      'username': username,
      'bio': bio,
      'jurusan': jurusan,
      'isAnonim': isAnonim,
      'roleAnonim': roleAnonim,
      'namaAnonim': namaAnonim
    });
  }

  //update data user di profile
  Future updateUserData(
    String email,
    String nama,
    String username,
    String bio,
    String jurusan,
    String roleAnonim,
    String namaAnonim,
  ) async {
    return await foruiCollection.document(uid).updateData({
      'email': email,
      'nama': nama,
      'username': username,
      'bio': bio,
      'jurusan': jurusan,
      'roleAnonim': roleAnonim,
      'namaAnonim': namaAnonim
    });
  }

  Stream<UserData> get userData {
    return foruiCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
        email: snapshot.data['email'],
        bio: snapshot.data['bio'],
        nama: snapshot.data['nama'],
        username: snapshot.data['username'],
        jurusan: snapshot.data['jurusan'],
        roleAnonim: snapshot.data['roleAnonim'] ?? '',
        namaAnonim: snapshot.data['namaAnonim'] ?? '');
  }

  final _bodyController = TextEditingController(
      text:
          "Hi! \nKamu telah diinvite untuk bergabung di salah satu thread yang kamu ikuti! Hubungi saya segera ya!");

  final _subjectController =
      TextEditingController(text: "Perekrutan Tim ForUI");

  final _recipientController =
      TextEditingController(text: "jidandhirayogagumbira@gmail.com");

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: [_recipientController.text],
    );
    try {
      await FlutterEmailSender.send(email);
      'success';
    } catch (error) {
      error.toString();
    }
  }
}
