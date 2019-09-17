import 'package:flutter/material.dart';
import 'package:flutter_f2chat/pages/me.dart';

Widget chatAppBar(BuildContext context) {
  return AppBar(
      title: Text(
        "Chat",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      leading: Builder(builder: (context) {
        return IconButton(
          icon: Icon(Icons.person, color: Colors.black), //自定义图标
          onPressed: () {
            // 打开抽屉菜单
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Me()));
          },
        );
      }),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.add, color: Colors.black), onPressed: () {})
      ]);
}
