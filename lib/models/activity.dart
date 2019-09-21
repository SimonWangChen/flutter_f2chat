class Activity {
  Activity();

  num id;
  String topic;
  String start_time;
  String city;
  String address;
  String host;
  String photo;
  String level;
  String update_time;

  Activity.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        topic = json['topic'],
        start_time = json['start_time'],
        city = json['city'],
        address = json['address'],
        host = json['host'],
        photo = json['photo'],
        level = json['level'],
        update_time = json['update_time'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'topic': topic,
        'start_time': start_time,
        'city': city,
        'address': address,
        'host': host,
        'photo': photo,
        'level': level,
        'update_time': update_time,
      };
}
