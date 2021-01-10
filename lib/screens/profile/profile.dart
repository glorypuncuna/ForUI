import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:forui/shared/custombutton.dart';
import 'package:forui/shared/customdropdown.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/customtextfield.dart';
import 'package:forui/models/user.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/services/database.dart';

import 'package:forui/shared/listjurusan.dart';

var _nama = '';
var _bio = '';
var _namaAnonim = '';
var _username = '';
var _email = '';
var _roleAnonim = '';
var _jurusan = '';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController _controllerNama = TextEditingController()..text = _nama;
  TextEditingController _controllerBio = TextEditingController()..text = _bio;
  TextEditingController _controllerNamaAnonim = TextEditingController()
    ..text = _namaAnonim;
  TextEditingController _controllerUsername = TextEditingController()
    ..text = _username;
  TextEditingController _controllerEmail = TextEditingController()
    ..text = _email;
  TextEditingController _controllerRoleAnonim = TextEditingController()
    ..text = _roleAnonim;
  TextEditingController _controllerJurusan = TextEditingController()
    ..text = _jurusan;

  updateUser(BuildContext context) {
    final user = Provider.of<User>(context);
    DatabaseService(uid: user.uid).updateUserData(
        _email, _nama, _username, _bio, _jurusan, _roleAnonim, _namaAnonim);
  }

  var listJurusan = listJurusanRaw.map<DropdownMenuItem<String>>(
    (String val) {
      return DropdownMenuItem<String>(
        value: val,
        child: Text(val),
      );
    },
  ).toList();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    _saveForm() async {
      setState(
        () {
          _nama = _controllerNama.text;
          _bio = _controllerBio.text;
          _namaAnonim = _controllerNamaAnonim.text;
          _username = _controllerUsername.text;
          _email = _controllerEmail.text;
          _roleAnonim = _controllerRoleAnonim.text;
          _jurusan = _controllerJurusan.text;
          Navigator.pop(context);
        },
      );
      updateUser(context);
    }

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            appBar: AppBar(title: Text('Profil Anda')),
            body: StreamBuilder<UserData>(
                stream: DatabaseService(uid: user.uid).userData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserData userData = snapshot.data;
                    _controllerNama = TextEditingController()
                      ..text = userData.nama;
                    _controllerBio = TextEditingController()
                      ..text = userData.bio;
                    _controllerEmail = TextEditingController()
                      ..text = userData.email;
                    _controllerUsername = TextEditingController()
                      ..text = userData.username;
                    _controllerNamaAnonim = TextEditingController()
                      ..text = userData.namaAnonim;
                    _controllerRoleAnonim = TextEditingController()
                      ..text = userData.roleAnonim;
                    _controllerJurusan = TextEditingController()
                      ..text = userData.jurusan;
                    return SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(64),
                              child: Image.asset(
                                'assets/images/profile_placeholder.png',
                                fit: BoxFit.cover,
                                height: 128,
                                width: 128,
                              ),
                            ),
                            CustomSeparator(32),
                            CustomTextField(
                              'Nama',
                              controller: _controllerNama,
                            ),
                            CustomSeparator(16),
                            CustomTextField(
                              'Biodata',
                              controller: _controllerBio,
                            ),
                            CustomSeparator(16),
                            CustomTextField(
                              'Nama Anonim',
                              controller: _controllerNamaAnonim,
                            ),
                            CustomSeparator(16),
                            CustomTextField(
                              'Username',
                              controller: _controllerUsername,
                            ),
                            CustomSeparator(16),
                            CustomTextField(
                              'Alamat email',
                              controller: _controllerEmail,
                            ),
                            CustomSeparator(16),
                            CustomTextField(
                              'Role Anda',
                              controller: _controllerRoleAnonim,
                            ),
                            CustomSeparator(16),
                            CustomButton(
                              'Simpan',
                              _saveForm,
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                })),
      ),
    );
  }
}

class MerchantTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  MerchantTextField(
    this.controller,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: text == 'Password' ? true : false,
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
