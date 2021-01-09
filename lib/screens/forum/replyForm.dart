import 'package:flutter/material.dart';

final isiBalasanController = TextEditingController();

Container replyForm(Function handler) {
  return Container(
      child: Form(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: new EdgeInsets.all(15.0),
            child: isiBalasan(),
          ),
          Container(
            alignment: Alignment.bottomRight,
            padding: new EdgeInsets.all(15.0),
            child: tombolKirimBalasan(handler),
          ),
        ],
      ),
    ),
  ));
}

TextFormField isiBalasan() {
  return TextFormField(
    controller: isiBalasanController,
    textCapitalization: TextCapitalization.sentences,
    keyboardType: TextInputType.multiline,
    maxLength: 300,
    maxLines: 5,
    decoration: const InputDecoration(
      fillColor: Colors.grey,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
      ),
      border: OutlineInputBorder(),
      hintText: 'Tulis Balasanmu',
      labelText: 'Balasan',
      labelStyle: TextStyle(color: Colors.black),
    ),
  );
}

RaisedButton tombolKirimBalasan(Function handler) {
  return RaisedButton(
    padding: const EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11),
      side: BorderSide(color: Colors.white60),
    ),
    child: Text(
      'Submit',
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    ),
    color: Colors.black,
    splashColor: Colors.grey,
    onPressed: handler,
  );
}
