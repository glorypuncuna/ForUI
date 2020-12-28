import 'package:flutter/material.dart';

import 'package:forui/services/auth.dart';
import 'package:forui/shared/customtextfield.dart';
import 'package:forui/shared/loading.dart';
import 'package:forui/shared/separator.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  String nama = '';
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
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
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
                              _CustomPasswordField(
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
                              'Register',
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
                                await _auth.registerEmail(email, password);
                            if (result == null) {
                              setState(
                                () {
                                  error = 'Registrasi tidak berhasil.';
                                  loading = false;
                                },
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}

class _CustomPasswordField extends StatelessWidget {
  final action;

  _CustomPasswordField(this.action);

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
        hintText: 'Password',
      ),
      obscureText: true,
      onChanged: action,
      validator: (val) => val.length < 8
          ? 'Masukkan password sepanjang 8 karakter atau lebih.'
          : null,
    );
  }
}
