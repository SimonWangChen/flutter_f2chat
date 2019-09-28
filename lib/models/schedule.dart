import 'package:flutter_f2chat/models/session.dart';

class Schedule {
  Schedule();

  num host;
  num guest;
  String start_time;
  num status;
  Session topic;

  Schedule.fromJson(Map<String, dynamic> json)
      : host = json['host'],
        guest = json['guest'],
        start_time = json['start_time'],
        status = json['status'],
        topic = json['topic'] == null
            ? null
            : Session.fromJson(json['topic'] as Map<String, dynamic>);

  Map<String, dynamic> toJson() => {
        'host': host,
        'guest': guest,
        'start_time': start_time,
        'status': status,
        'topic': topic
      };
}
