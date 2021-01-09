import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:forui/screens/home/profileNotifier.dart';

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  //Unlock pas ngga anonim lagi
  String email;
  String nama;
  String username;
  String bio;
  String jurusan;

  //Yang ditampilin pas anonim
  bool isAnonim;
  String roleAnonim;
  String namaAnonim;

  UserData({
    this.email,
    this.nama,
    this.username,
    this.bio,
    this.jurusan,
    this.isAnonim,
    this.roleAnonim,
    this.namaAnonim,
  });

  UserData.fromMap(Map<String, dynamic> data) {
    email = data['email'];
    nama = data['nama'];
    username = data['username'];
    bio = data['bio'];
    jurusan = data['jurusan'];
    isAnonim = data['isAnonim'];
    roleAnonim = data['roleAnonim'];
    namaAnonim = data['namaAnonim'];
  }

  //User data diambil ke forum di sini
  getUserData(ProfileNotifier profileNotifier) async {
    QuerySnapshot snapshot =
        await Firestore.instance.collection('users').getDocuments();
    List<UserData> _profileList = [];
    snapshot.documents.forEach(
      (doc) {
        UserData data = UserData.fromMap(doc.data);
        _profileList.add(data);
      },
    );
    profileNotifier.profileList = _profileList;
  }
}
