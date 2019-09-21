import 'package:flutter/material.dart';
import 'package:flutter_f2chat/components/activity_appbar.dart';
import 'package:flutter_f2chat/pages/activity.dart';

//import 'package:flutter_f2chat/pages/chat.dart';
import 'package:flutter_f2chat/pages/discover.dart';
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
//      ChatPage(),
      ActivityPage(),
      MatePage(),
      MomentsPage(),
    ];
  }

  _appbar(int index, BuildContext context) {
    switch (index) {
      case 0:
        return scheduleAppBar(context);
        break;
      case 1:
//        return chatAppBar(context);
        return activityAppBar(context);
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
          BottomNavigationBarItem(
              icon: Icon(Icons.wb_sunny), title: Text('Activity')),
//          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('Chats')),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text('Discover')),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.language), title: Text('Moments')),
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
