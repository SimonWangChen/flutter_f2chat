class Session {
  Session();

  num id;
  num courseType;
  num level;
  String topic;
  String platform_file_id;


  Session.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        courseType = json['courseType'],
        level = json['level'],
        topic = json['topic'],
        platform_file_id = json['platform_file_id'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'courseType': courseType,
    'level': level,
    'topic': topic,
    'platform_file_id': platform_file_id
  };
}