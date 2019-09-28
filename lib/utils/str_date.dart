import 'package:flustars/flustars.dart';
import 'package:flutter_f2chat/global/date_short.dart';
import 'package:date_format/date_format.dart';

class StrDateTime {
  String strDateTime;

  StrDateTime(this.strDateTime);

  DateTime getDatetime() {
    return DateTime.parse(strDateTime);
  }

  static String getDatetimeFromStamp(String time) {
    return formatDate(DateTime.fromMillisecondsSinceEpoch(int.parse(time)) , [yyyy, '-', mm, '-', dd, ' ', DD, ' ', HH, ':', nn]);
  }

  String getMinute() {
    return getDatetime().hour.toString() +
        ":" +
        getDatetime().minute.toString().padLeft(2, '0');
  }

  static getMonth(String time) {
    return monthCode[DateTime.parse(DateUtil.getDateStrByMs(int.parse(time)))
        .month];
  }
}
