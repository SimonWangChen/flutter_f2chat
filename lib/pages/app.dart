import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/chat_item.dart';
import 'package:flutter_f2chat/components/chat_message.dart';
import 'package:flutter_f2chat/pages/chat.dart';
import 'package:flutter_f2chat/pages/chat_search.dart';
import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter_f2chat/pages/discover.dart';
import 'package:flutter_f2chat/pages/me.dart';
import 'package:flutter_f2chat/pages/moments.dart';
import 'package:flutter_f2chat/pages/schedule.dart';
import 'package:flutter_f2chat/components/chat_appbar.dart';
import 'package:flutter_f2chat/components/schedule_appbar.dart';
import 'package:flutter_f2chat/components/moments_appbar.dart';
import 'package:flutter_f2chat/components/discover_appbar.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int _selectedIndex = 0;
  var _pagelist;

  @override
  void initState() {
    super.initState();
    _pagelist = [
      SchedulePage(),
      ChatPage(),
      DiscoverPage(),
      MomentsPage(),
    ];
  }

  _appbar(int index, BuildContext context){
    switch (index){
      case 0:
        return scheduleAppBar(context);
        break;
      case 1:
        return chatAppBar(context);
        break;
      case 2:
        return discoverAppBar(context);
        break;
      case 3:
        return momentsAppBar(context);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(_selectedIndex, context),
      body: _pagelist[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), title: Text('Schedule')),
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text('Discover')),
          BottomNavigationBarItem(
              icon: Icon(Icons.language), title: Text('Moments')),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

