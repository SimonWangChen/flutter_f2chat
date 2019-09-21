class Schedule {
  Schedule();

  num host;
  num guest;
  String start_time;
  num status;
  num topic;

  Schedule.fromJson(Map<String, dynamic> json)
      : host = json['host'],
        guest = json['guest'],
        start_time = json['start_time'],
        status = json['status'],
        topic = json['topic'];

  Map<String, dynamic> toJson() => {
        'host': host,
        'guest': guest,
        'start_time': start_time,
        'status': status,
        'topic': topic
      };
}
