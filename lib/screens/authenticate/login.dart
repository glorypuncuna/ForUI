import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:forui/services/auth.dart';
import 'package:forui/shared/loading.dart';

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

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : WillPopScope(
            onWillPop: () async {
              widget.toggleView();
            },
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
                              _LoginSeparator(64.0),
                              _LoginTextField(
                                'Username atau alamat email',
                                'Masukkan username atau alamat email yang sesuai.',
                                TextInputType.emailAddress,
                                false,
                                (val) {
                                  setState(() => email = val);
                                },
                              ),
                              _LoginSeparator(16.0),
                              _LoginTextField(
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
                      _LoginSeparator(16.0),
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
                      _LoginSeparator(16.0),
                      InkWell(
                        child: Container(
                          child: Center(
                            child: Text(
                              'Register',
                            ),
                          ),
                        ),
                        onTap: () async {
                          widget.toggleView();
                        },
                      ),
                      _LoginSeparator(16.0),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

class _LoginSeparator extends StatelessWidget {
  final size;

  _LoginSeparator(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class _LoginTextField extends StatelessWidget {
  final hintText, validatorText, keyboardType, obscureText, action;

  _LoginTextField(this.hintText, this.validatorText, this.keyboardType,
      this.obscureText, this.action);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        hintText: hintText,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: action,
      validator: (val) => (val.isEmpty) ? validatorText : null,
    );
  }
}
