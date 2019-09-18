/// 预约状态
enum ScheduleStatus { Booked, Done, Start, Miss }

///预约数据
class ScheduleData {
  ///事件主题
  String topic;

  ///房主, 客人
  String host;
  String guest;

  ///事件开始时间
  DateTime time;

  ///时间状态
  ScheduleStatus status;

  ScheduleData(this.topic, this.host, this.guest, this.time, this.status);
}

//组装数据
List<ScheduleData> scheduleData = [
  ScheduleData('topic', 'host', 'guest', DateTime.now(), ScheduleStatus.Booked),
  ScheduleData('topic', 'host', 'guest', DateTime.now(), ScheduleStatus.Booked),
];
