import 'package:flutter/material.dart';
import 'package:flutter_f2chat/models/schedule.dart';
import 'touch_callback.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        onPressed: () {},
        //整体水平方向布局
        child: Row(
          //垂直方向居中显示
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //展示头像
            Container(
              //头像左右留一定的外边距

              margin: const EdgeInsets.only(left: 13.0, right: 13.0, top: 30.0),
              child: Column(
                children: <Widget>[
                  Text(
                    _schedule.start_time,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  )
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
                    _schedule.topic.toString(),
                    style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
                    maxLines: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Host: ${_schedule.host}",
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                        maxLines: 1,
                        //显示不完的文本用省略号来表示
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                      ),
                      Text(
                        "Guest: ${_schedule.guest}",
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                        maxLines: 1,
                        //显示不完的文本用省略号来表示
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(right: 15.0, top: 12.0),
                child: Icon(
                  FontAwesomeIcons.video,
                  color: Colors.greenAccent,
                )),
          ],
        ),
      ),
    );
  }
}
