import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/chat_item.dart';
import 'package:flutter_f2chat/components/chat_message.dart';
import 'package:flutter_f2chat/pages/chat_search.dart';
import 'package:floating_search_bar/floating_search_bar.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FloatingSearchBar.builder(
        itemCount: messageData.length,
        itemBuilder: (BuildContext context, int index) {
          return MessageItem(messageData[index]);
        },
        leading: Icon(Icons.search),
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ChatSearch()));
        },
      ),
    );
  }
}


