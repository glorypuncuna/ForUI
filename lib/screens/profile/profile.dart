import 'package:flutter/material.dart';

import 'package:forui/shared/custombutton.dart';
import 'package:forui/shared/customdropdown.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/customtextfield.dart';

import 'package:forui/shared/listjurusan.dart';

var _nama = 'Jidan';
var _bio = '';
var _namaAnonim = 'Aster#1429';
var _username = 'jidandg';
var _email = 'jidandg@admin.com';
var _roleAnonim = 'Programmer';
var _jurusan = 'FT - Teknik Komputer';

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
          body: SingleChildScrollView(
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
                  CustomDropDown(
                    'Jurusan',
                    listJurusan,
                    (val) => setState(() => _jurusan = val),
                    value: _jurusan,
                  ),
                  CustomSeparator(16),
                  CustomButton(
                    'Simpan',
                    _saveForm,
                  ),
                ],
              ),
            ),
          ),
        ),
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
