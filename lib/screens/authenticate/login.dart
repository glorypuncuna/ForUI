import 'package:flutter/material.dart';
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
            // ignore: missing_return
            onWillPop: () async {
              widget.toggleView();
            },
            child: Scaffold(
              body: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 100),
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 200,
                      width: 300,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Open Sans",
                                fontWeight: FontWeight.w300,
                              ),
                              decoration: InputDecoration(
                                  labelText: "Username atau alamat email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) => (val.isEmpty)
                                  ? "Masukkan email yang valid"
                                  : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            SizedBox(height: 20),
                            TextFormField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontFamily: "Open Sans",
                                fontWeight: FontWeight.w300,
                              ),
                              decoration:
                                  InputDecoration(labelText: "Password"),
                              obscureText: true,
                              validator: (val) => val.length < 8
                                  ? "Masukkan password sepanjang 8 huruf atau lebih"
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        width: 150,
                        height: 50,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w700,
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
                              },
                            );
                          }
                        }
                      },
                    ),
                    SizedBox(height: 15.0),
                    InkWell(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 11,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      onTap: () async {
                        widget.toggleView();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
