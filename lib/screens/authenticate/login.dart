import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:forui/screens/authenticate/register.dart';
import 'package:forui/services/auth.dart';
import 'package:forui/shared/custombackground.dart';
import 'package:forui/shared/custombutton.dart';
import 'package:forui/shared/customloading.dart';
import 'package:forui/shared/custompasswordfield.dart';
import 'package:forui/shared/customseparator.dart';
import 'package:forui/shared/customtextfield.dart';

class Login extends StatefulWidget {
  final darkTheme, toggleView;

  Login(this.darkTheme, {this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  var _showEmailKeyboard = TextInputType.emailAddress;
  bool _isRegister = false;
  bool _obscureText = true;

  final _teksLoginGagal =
      'Login tidak berhasil. Periksa kembali email, password, atau koneksi internet anda.';

  bool _loading = false;

  _toggle() => setState(() => _obscureText = !_obscureText);

  _login() async {
    if (_formKey.currentState.validate()) {
      setState(() => _loading = true);
      dynamic result = await _auth.loginEmail(_email, _password);
      if (result == null) {
        setState(
          () {
            _loading = false;
            showToast(
              _teksLoginGagal,
              borderRadius: BorderRadius.all(Radius.circular(64)),
              context: context,
            );
          },
        );
      }
    }
  }

  _register() async => Navigator.push(context,
      MaterialPageRoute(builder: (context) => Register(widget.darkTheme)));

  Future<bool> _exitDialog() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Apakah Anda yakin ingin keluar dari ForUI?'),
        title: Text('Konfirmasi Keluar'),
        actions: [
          _CustomDialogButton('Batal', () => Navigator.pop(context)),
          _CustomDialogButton('Keluar', () => exit(0)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? CustomLoading(widget.darkTheme)
        : GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: WillPopScope(
              onWillPop: _exitDialog,
              child: Scaffold(
                body: Stack(
                  children: [
                    CustomBackground(widget.darkTheme),
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
                                    widget.darkTheme
                                        ? 'assets/images/forui_text_alt.png'
                                        : 'assets/images/forui_text.png',
                                  ),
                                ),
                                CustomSeparator(128),
                                CustomTextField(
                                  'Alamat email',
                                  action: (val) => setState(() => _email = val),
                                  showEmailKeyboard: _showEmailKeyboard,
                                ),
                                CustomSeparator(16),
                                CustomPasswordField(
                                  'Password',
                                  (val) => setState(() => _password = val),
                                  _isRegister,
                                  _obscureText,
                                  _toggle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        CustomSeparator(16),
                        CustomButton(
                          'Login',
                          _login,
                        ),
                        CustomButtonAlt(
                          'Daftar',
                          _register,
                        ),
                      ],
                    ),
                  ],
                ),
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
      child: Text(hintText),
      onPressed: action,
    );
  }
}
