class User {
  User();

  int id;
  String username;
  String avatar;
  String birthday;
  String gender;
  int motherTongue;
  int level;
  int preferTongue;
  String intro;
  int available_events;
  int teach_times;
  int learn_times;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        avatar = json['avatar'],
        birthday = json['birthday'],
        gender = json['gender'],
        motherTongue = json['motherTongue'],
        level = json['level'],
        preferTongue = json['preferTongue'],
        intro = json['intro'],
        available_events = json['available_events'],
        teach_times = json['teach_times'],
        learn_times = json['learn_times']
  ;

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'avatar': avatar,
        'birthday': birthday,
        'gender': gender,
        'motherTongue': motherTongue,
        'level': level,
        'preferTongue': preferTongue,
        'intro': intro,
        'available_events': available_events,
        'teach_times': teach_times,
        'learn_times': learn_times,
      };
}
