import 'package:flutter/material.dart';
import 'package:flutter_f2chat/models/users.dart';
import 'touch_callback.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_f2chat/global/data_assist.dart';

//聊天信息项
class UserItem extends StatelessWidget {
  final User _user;

  UserItem(this._user);

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
      height: 120.0,
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

              margin: const EdgeInsets.only(left: 13.0, right: 13.0),
              child: CircleAvatar(
                //头像半径
                radius: 45,
                //头像图片
                backgroundImage: NetworkImage(_user.avatar),
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
                    _user.username,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF353535),
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                  ),
                  Text(
                    _user.intro,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Color(0xFF353535),
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        languageCode[_user.motherTongue],
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xFFa9a9a9)),
                        maxLines: 1,
                        //显示不完的文本用省略号来表示
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      Text(
                        languageCode[_user.preferTongue] +
                            ': Level ${_user.level}',
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
              alignment: AlignmentDirectional.centerEnd,
              margin: const EdgeInsets.only(right: 12.0, top: 12.0),
              child: Center(
                //时间顶部对齐
                child: Column(
                  children: <Widget>[
                    ageGender(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Row(children: [
                      Text(
                        'Events: ${_user.available_events}',
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xFF353535),
                            fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ageGender() {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: _user.gender == 'male' ? Colors.blue : Colors.red,
            borderRadius: BorderRadius.circular(3.0), //3像素圆角
            boxShadow: [
              //阴影
              BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0)
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
          child: Row(
            children: <Widget>[
              Icon(
                _user.gender == 'male'
                    ? FontAwesomeIcons.mars
                    : FontAwesomeIcons.venus,
                color: Colors.white,
              ),
              Text(
                //格式化时间
                (DateTime.now()
                            .difference(DateTime.parse(_user.birthday))
                            .inDays ~/
                        365)
                    .toString(),
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
