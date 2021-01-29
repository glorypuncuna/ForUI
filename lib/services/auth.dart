import 'package:firebase_auth/firebase_auth.dart';

import 'package:forui/models/user.dart';
import 'package:forui/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  /*
  Future registerEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  */

  Future registerEmail(
      String email,
      String password,
      String nama,
      String username,
      String bio,
      String jurusan,
      bool isAnonim,
      String roleAnonim,
      String namaAnonim) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await user.sendEmailVerification();

      //membuat document untuk setiap user, sebagai koleksi data
      await DatabaseService(uid: user.uid).uploadUserData(email, nama, username,
          bio, jurusan, isAnonim, roleAnonim, namaAnonim);

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future loginEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
