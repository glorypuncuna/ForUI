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
                            "Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: "Open Sans",
                              fontWeight: FontWeight.w300,
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
              ),
            ),
          );
  }
}
