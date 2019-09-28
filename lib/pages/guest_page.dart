import 'package:flutter/material.dart';

class BookEventPage extends StatefulWidget {
  @override
  _BookEventPageState createState() => _BookEventPageState();
}

class _BookEventPageState extends State<BookEventPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guest'),
        elevation: 0.0,
      ),
      body: Wrap(children: <Widget>[
        Text("fuck"),
      ],)

    );
  }

}
