import 'package:flutter/material.dart';
import 'package:flutter_f2chat/global/data_assist.dart';
import 'package:flutter_f2chat/global/date_short.dart';
import 'package:flutter_f2chat/models/schedule.dart';
import 'package:flutter_f2chat/pages/event_detail.dart';
import 'package:flutter_f2chat/pages/schedule_detail.dart';
import 'package:flutter_f2chat/utils/str_date.dart';
import 'touch_callback.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flustars/flustars.dart';

//聊天信息项
class ScheduleItem extends StatelessWidget {
  final Schedule _schedule;

  ScheduleItem(this._schedule);

  @override
  Widget build(BuildContext context) {
    //最外层容器
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        //仅加一个底部边 这样整个列表的每项信息下面都会有一条边
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xFFd9d9d9))),
      ),
      height: 80.0,
      //按下回调处理 空实现
      child: TouchCallBack(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                if (_schedule.topic != null) {
                  return ScheduleDetail(
                    // 路由参数
                    schedule: _schedule,
                  );
                } else {
                  return EventDetail(
                    // 路由参数
                    schedule: _schedule,
                  );
                }
              },
            ),
          );
        },
        //整体水平方向布局
        child: Row(
          //垂直方向居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            Container(
              //头像左右留一定的外边距
              alignment: Alignment.center,
              width: 90.0,
              margin: const EdgeInsets.only(left: 13.0, right: 13.0, top: 8.0),
              child: Column(
                children: <Widget>[
                  Text(
                    StrDateTime.getMonth(_schedule.start_time),
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                  ),
                  Text(
                    StrDateTime(DateUtil.getDateStrByMs(
                            int.parse(_schedule.start_time)))
                        .getDatetime()
                        .day
                        .toString(),
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        weekdayCode[StrDateTime(DateUtil.getDateStrByMs(
                                int.parse(_schedule.start_time)))
                            .getDatetime()
                            .weekday],
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text(
                        StrDateTime(DateUtil.getDateStrByMs(
                                int.parse(_schedule.start_time)))
                            .getMinute(),
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              //主标题和子标题采用垂直布局
              child: Column(
                //垂直方向居中对齐
                mainAxisAlignment: MainAxisAlignment.center,
                //水平方向靠左对齐
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _buildTopic(),
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 15.0, top: 12.0),
                child: _buildStatus(_schedule.status)),
          ],
        ),
      ),
    );
  }

  String _buildTopic() {
    if (_schedule.topic != null) {
      return _schedule.topic.topic.toString();
    } else {
      return "You Host";
    }
  }

  Widget _buildStatus(int code) {
    switch (code) {
      case 0:
        return Text(
          statusCode[code],
          style: TextStyle(color: Colors.green),
        );
        break;
      case 1:
        return Text(
          statusCode[code],
          style: TextStyle(color: Colors.red),
        );
        break;
      case 2:
        return Text(
          statusCode[code],
          style: TextStyle(color: Colors.blue),
        );
        break;
      case 3:
        return Text(
          statusCode[code],
          style: TextStyle(color: Colors.lightBlue),
        );
        break;
    }
  }
}
