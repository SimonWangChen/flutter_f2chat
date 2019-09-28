import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/avatarIcon.dart';

Widget discoverAppBar(BuildContext context) {
  return AppBar(
      title: Text(
        "Discover",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Builder(builder: (context) {
        return avatarBar(context);
      }),
//      actions: <Widget>[
//        IconButton(icon: Icon(Icons.add, color: Colors.black), onPressed: () {})
//      ]
  );
}
