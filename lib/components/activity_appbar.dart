import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/avatarIcon.dart';
import 'package:flutter_f2chat/pages/me.dart';

Widget activityAppBar(BuildContext context) {
  return AppBar(
      title: Text(
        "Activity",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Builder(builder: (context) {
        return avatarBar(context);
      }),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add, color: Colors.black), onPressed: () {})
      ]);
}
