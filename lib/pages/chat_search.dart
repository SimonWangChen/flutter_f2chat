import 'package:flutter/material.dart';

class ChatSearch extends StatefulWidget {
  @override
  _ChatSearchState createState() => _ChatSearchState();
}

class _ChatSearchState extends State<ChatSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Search"),
        ),
        body: Stack(
      children: <Widget>[
        Center(child: Text("Search")),
      ],
    ));
  }
}
