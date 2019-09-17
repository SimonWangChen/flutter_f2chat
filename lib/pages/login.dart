import 'package:flutter/material.dart';
import 'package:flutter_f2chat/pages/chat.dart';

class Login extends StatefulWidget{

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  bool isLogged = true;

  @override
  void initState() {
    super.initState();
    isLogedIn();
  }

  void isLogedIn(){
    if (!isLogged) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChatPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: <Widget>[
        Text("Login"),
      ],
    ));
  }
}