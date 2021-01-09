import 'package:flutter/material.dart';
import 'dart:math';

import 'package:forui/services/auth.dart';
import 'package:forui/shared/custombackground.dart';
import 'package:forui/shared/custombutton.dart';
import 'package:forui/shared/customcolors.dart';
import 'package:forui/shared/customdropdown.dart';
import 'package:forui/shared/customloading.dart';
import 'package:forui/shared/custompasswordfield.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/customtextfield.dart';

import 'package:forui/shared/listnama.dart';
import 'package:forui/shared/listjurusan.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _nama = '';
  String _username = '';
  String _email = '';
  String _password = '';
  String _jurusan = '';
  String _bio = '';
  bool _isAnonim = true;
  String _namaAnonim = '';
  String _roleAnonim = '';

  var listJurusan = listJurusanRaw.map<DropdownMenuItem<String>>(
    (String val) {
      return DropdownMenuItem<String>(
        value: val,
        child: Text(val),
      );
    },
  ).toList();

  final _showEmailKeyboard = TextInputType.emailAddress;
  bool _isRegister = true;
  bool _obscureText = true;

  bool _loading = false;

  String _generateNamaAnonim =
      listNama[Random(new DateTime.now().millisecondsSinceEpoch).nextInt(49)] +
          ' No. ' +
          (1000 +
                  new Random(new DateTime.now().millisecondsSinceEpoch)
                      .nextInt(8999))
              .toString();

  void _toggle() => setState(() => _obscureText = !_obscureText);

  _login() async => Navigator.pop(context);

  _register() async {
    if (_formKey.currentState.validate()) {
      setState(
        () {
          _namaAnonim = _generateNamaAnonim;
          _loading = true;
        },
      );
      dynamic result = await _auth.registerEmail(
        _email,
        _password,
        _nama,
        _username,
        _bio,
        _jurusan,
        _isAnonim,
        _roleAnonim,
        _namaAnonim,
      );
      if (result == null) {
        setState(
          () => _loading = false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? CustomLoading()
        : GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Scaffold(
              body: Stack(
                children: [
                  CustomBackground(),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  'Nama',
                                  customGrey,
                                  (val) => setState(() => _nama = val),
                                ),
                                CustomSeparator(16),
                                CustomTextField(
                                  'Username',
                                  customGrey,
                                  (val) => setState(() => _username = val),
                                ),
                                CustomSeparator(16),
                                CustomTextField(
                                  'Alamat email',
                                  customGrey,
                                  (val) => setState(() => _email = val),
                                  showEmailKeyboard: _showEmailKeyboard,
                                ),
                                CustomSeparator(16),
                                CustomPasswordField(
                                  'Password',
                                  customGrey,
                                  (val) => setState(() => _password = val),
                                  _isRegister,
                                  _obscureText,
                                  _toggle,
                                ),
                                CustomSeparator(16),
                                CustomTextField(
                                  'Role Anda',
                                  customGrey,
                                  (val) => setState(() => _roleAnonim = val),
                                ),
                                CustomSeparator(16),
                                CustomDropDown(
                                  'Jurusan',
                                  listJurusan,
                                  (val) => setState(() => _jurusan = val),
                                ),
                              ],
                            ),
                          ),
                          CustomSeparator(16),
                          CustomButton(
                            'Daftar',
                            _register,
                            false,
                            true,
                            false,
                            color: customGrey,
                          ),
                          CustomButton(
                            'Masuk',
                            _login,
                            true,
                            false,
                            true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
