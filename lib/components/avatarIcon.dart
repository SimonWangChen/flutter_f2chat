import 'package:flutter/material.dart';
import 'package:flutter_f2chat/global/global.dart';

Widget avatarBar(BuildContext context){
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.only(bottom: 8, left: 8),
      child: ClipOval(
        // 如果已登录，则显示用户头像；若未登录，则显示默认头像
        child: CircleAvatar(
          //头像半径
          radius: 30,
          //头像图片
          backgroundImage: NetworkImage(Global.profile.user.avatar),
        ),
      ),
    ),
    onTap: () {
      Navigator.pushNamed(context,'userprofile');
    },
  );
}
