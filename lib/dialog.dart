import 'package:firebase_log/show.dart';
import 'package:flutter/material.dart';

Future<void> normalDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Ok',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Future<void> checkDialog(BuildContext context, String message) async {
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(message),
      children: <Widget>[
        FlatButton(
          onPressed: () {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (context) => ShowApp());
            Navigator.push(context, materialPageRoute);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Ok',
                style: TextStyle(color: Colors.green,fontSize: 20),
              ),
            ],
          ),
        ),
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Cancel',
                style: TextStyle(color: Colors.red,fontSize: 17),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
