import 'package:flutter/material.dart';
import 'mainForum.dart';

class BalasDiskusi extends StatelessWidget {
  final String text;

  BalasDiskusi(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(child: balasDiskusi(this.text));
  }
}

Wrap balasDiskusi(String text) {
  return Wrap(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        margin: new EdgeInsets.all(15),
        padding: new EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(children: [
                Icon(Icons.person),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bebek Anonim',
                      textAlign: TextAlign.left,
                    ),
                    waktuJawab(),
                  ],
                ),
              ]),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 10),
              child: Text(
                text,
                textAlign: TextAlign.left,
              ),
            ),
            Text(
              'Reply',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Row waktuJawab() {
  return Row(
    children: [
      Container(
        margin: EdgeInsets.only(right: 95),
        child: Text(
          'Tanggal Sekarang',
          style: styleWaktu,
        ),
      ),
      Container(
        alignment: Alignment.bottomRight,
        child: Text(
          'Jam Sekarang',
          style: styleWaktu,
        ),
      ),
    ],
  );
}
