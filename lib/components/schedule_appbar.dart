import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/avatarIcon.dart';
import 'package:flutter_f2chat/pages/guest_page.dart';
import 'package:flutter_f2chat/pages/host_page.dart';

Widget scheduleAppBar(BuildContext context) {
  return AppBar(
      title: GestureDetector(
        child: Text(
          "Schedule",
          style: TextStyle(color: Colors.black),
        ),
        onTap: () {},
      ),
      backgroundColor: Colors.white,
      leading: Builder(builder: (context) {
        return avatarBar(context);
      }),
      actions: <Widget>[
        PopupMenuButton(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  new PopupMenuItem(value: "Host", child: new Text("Teach")),
                  new PopupMenuItem(value: "Guest", child: new Text("Learn")),
                  new PopupMenuItem(
                      value: "Private", child: new Text("Private")),
                ],
            icon: Icon(Icons.add, color: Colors.black),
            onSelected: (String value) {
              switch(value){
                case "Host":
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CrateHostPage()));
                  break;
                case "Guest":
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BookEventPage()));
                  break;
              }
            }),
      ]);
}
