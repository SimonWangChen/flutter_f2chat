import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f2chat/models/activity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_f2chat/utils/str_date.dart';
import 'package:flutter_f2chat/global/date_short.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard(this.activity);


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                color: Colors.deepOrange,
                child: CachedNetworkImage(imageUrl: activity.photo),
              ),
              Positioned(
                child: Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: 80.0,
                    height: 60.0,
                    color: Colors.black45,
                  ),
                ),
                left: 0.0,
                bottom: 0.0,
              ),
              Positioned(
                child: Row(
                  children: <Widget>[
                    Text(
                      StrDateTime(activity.start_time).getDatetime().day.toString(),
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Text(
                      weekdayCode[StrDateTime(activity.start_time).getDatetime().weekday],
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                  ],
                ),
                left: 10.0,
                bottom: 30.0,
              ),
              Positioned(
                child: Text(
                  StrDateTime(activity.start_time).getMinute(),
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                left: 10.0,
                bottom: 7.0,
              ),
            ],
          ),
          Container(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
            child: Text(
              activity.topic,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  width: ScreenUtil().setWidth(250),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.red,),
                      Text(
                        activity.host,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.home, color: Colors.green,),
                      Text(
                        activity.address,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
