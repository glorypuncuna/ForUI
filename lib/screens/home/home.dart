import 'package:flutter/material.dart';
import 'package:forui/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text(
            'Lorem ipsum',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
