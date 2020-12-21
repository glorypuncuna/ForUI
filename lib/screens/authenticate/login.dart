import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:forui/screens/authenticate/register.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/shared/customtextfield.dart';
import 'package:forui/shared/loading.dart';
import 'package:forui/shared/separator.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  Future<bool> _exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Apakah Anda yakin ingin keluar dari ForUI?'),
        title: Text('Konfirmasi Keluar'),
        actions: <Widget>[
          _CustomDialogButton(
            'Batal',
            () => Navigator.pop(context),
          ),
          _CustomDialogButton(
            'Keluar',
            () => exit(0),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : WillPopScope(
            onWillPop: _exitDialog,
            child: Scaffold(
              body: Stack(
                children: [
                  Image.asset(
                    'assets/images/background_ui.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Opacity(
                    opacity: 0.8,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                width: 256,
                                child: Image.asset(
                                  'assets/images/forui_logo_text.png',
                                ),
                              ),
                              Separator(128),
                              CustomTextField(
                                'Username atau alamat email',
                                'Masukkan username atau alamat email yang sesuai.',
                                TextInputType.emailAddress,
                                false,
                                (val) {
                                  setState(() => email = val);
                                },
                              ),
                              Separator(16),
                              CustomTextField(
                                'Password',
                                'Masukkan password yang sesuai.',
                                null,
                                true,
                                (val) {
                                  setState(() => password = val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Separator(16),
                      InkWell(
                        child: Container(
                          width: 128,
                          height: 48,
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            setState(
                              () {
                                loading = true;
                              },
                            );
                            dynamic result =
                                await _auth.loginEmail(email, password);
                            if (result == null) {
                              setState(
                                () {
                                  error =
                                      'Login tidak berhasil. Periksa kembali email, password, dan koneksi internet anda.';
                                  loading = false;
                                  showToast(
                                    'Login tidak berhasil. Periksa kembali email, password, dan koneksi internet anda.',
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(0),
                                    ),
                                    context: context,
                                  );
                                },
                              );
                            }
                          }
                        },
                      ),
                      Separator(16),
                      InkWell(
                          child: Container(
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          }),
                      Separator(16),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

class _CustomDialogButton extends StatelessWidget {
  final hintText, action;

  _CustomDialogButton(this.hintText, this.action);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        hintText,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: action,
    );
  }
}
