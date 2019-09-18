import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/chat_item.dart';
import 'package:flutter_f2chat/components/chat_message.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (BuildContext context, int index) {
          return MessageItem(messageData[index]);
        });
  }
}
