import 'package:flutter/material.dart';

import 'package:forui/services/auth.dart';
import 'package:forui/shared/loading.dart';

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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _RegisterTextField(
                                (val) {
                                  setState(() => email = val);
                                },
                              ),
                              _RegisterSeparator(16.0),
                              _RegisterPasswordField(
                                (val) {
                                  setState(() => password = val);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      _RegisterSeparator(16.0),
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

class _RegisterSeparator extends StatelessWidget {
  final size;

  _RegisterSeparator(this.size);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

class _RegisterTextField extends StatelessWidget {
  final action;

  _RegisterTextField(this.action);

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
        hintText: 'Username atau alamat email',
      ),
      keyboardType: TextInputType.emailAddress,
      onChanged: action,
      validator: (val) => (val.isEmpty)
          ? 'Masukkan username atau alamat email yang sesuai.'
          : null,
    );
  }
}

class _RegisterPasswordField extends StatelessWidget {
  final action;

  _RegisterPasswordField(this.action);

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
