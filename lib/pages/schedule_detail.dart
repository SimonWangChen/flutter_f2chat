import 'package:flutter/material.dart';
import 'package:flutter_f2chat/models/schedule.dart';
import 'package:flutter_f2chat/models/users.dart';
import 'package:flutter_f2chat/utils/str_date.dart';
import 'package:flutter_f2chat/api/proclassmates.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScheduleDetail extends StatefulWidget {
  ScheduleDetail({
    Key key,
    @required this.schedule, // 接收一个text参数
  }) : super(key: key);
  final Schedule schedule;

  @override
  _ScheduleDetailState createState() {
    // TODO: implement createState
    return _ScheduleDetailState(schedule);
  }
}

class _ScheduleDetailState extends State {
  _ScheduleDetailState(Schedule schedule) {
    this.schedule = schedule;
  }

  Schedule schedule;
  User _host;
  User _guest;

  @override
  void initState() {
    super.initState();
    ProClassmates.getUserDetail(schedule.host).then((e) {
      setState(() {
        _host = e;
      });
    });
    ProClassmates.getUserDetail(schedule.guest).then((e) {
      setState(() {
        _guest = e;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('F2F'),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    if (_host != null && _guest != null) {
      return Wrap(
        children: <Widget>[
          Image(
            image: AssetImage("imgs/study.png"),
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Time',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text(
                  StrDateTime.getDatetimeFromStamp(schedule.start_time),
                  style: TextStyle(color: Colors.red),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text('20 minutes', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Host',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8, left: 8),
                        child: ClipOval(
                          // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                          child: CircleAvatar(
                            //头像半径
                            radius: 30,
                            //头像图片
                            backgroundImage: NetworkImage(_host.avatar),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'userprofile');
                      },
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 30)),
                Column(
                  children: <Widget>[
                    Text(
                      'Guest',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8),
                        child: ClipOval(
                          // 如果已登录，则显示用户头像；若未登录，则显示默认头像
                          child: CircleAvatar(
                            //头像半径
                            radius: 30,
                            //头像图片
                            backgroundImage: NetworkImage(_guest.avatar),
                          ),

                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'userprofile');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Topic',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(bottom: 8)),
                Text(
                    "Level${schedule.topic.level.toString()}--"
                    "${schedule.topic.topic.toString()}",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          Divider(
            height: 1.0,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 100,
                child: OutlineButton(
                  onPressed: () {},
                  child: Text('Cancle'),
                  splashColor: Colors.blue,
                  // 设置溅墨效果的颜色
                  color: Theme.of(context).primaryColor,
                  // 设置按钮背景颜色
                  textColor: Colors.indigo,
                  // 设置文字的颜色
                  textTheme: ButtonTextTheme.primary,
                  // 设置按钮文字颜色
                  borderSide: BorderSide(color: Colors.indigo),
                  // 设置描边颜色
                  highlightedBorderColor: Colors.blue, // 设置高亮状态描边的颜色
                ),
              )), // works
        ],
      );
    } else {
      return Stack(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 35.0),
            child: new Center(
              child: SpinKitFadingCircle(
                color: Colors.blueAccent,
                size: 30.0,
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
            child: new Center(
              child: new Text('Loading!'),
            ),
          ),
        ],
      );
    }
  }
}
