import 'package:flutter/material.dart';
import 'anonymProf.dart';
import 'mainForum.dart';

class BalasDiskusi extends StatelessWidget {
  final String text;

  BalasDiskusi(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(child: balasDiskusi(context, this.text));
  }
}

Wrap balasDiskusi(context, String text) {
  return Wrap(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        margin: new EdgeInsets.all(10),
        padding: new EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(children: [
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AnonymProfile()),
                    );
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jidan',
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
          '11 Januari 2021',
          style: styleWaktu,
        ),
      ),
      Container(
        alignment: Alignment.bottomRight,
        child: Text(
          '',
          style: styleWaktu,
        ),
      ),
    ],
  );
}
