import 'package:flutter/material.dart';


import 'package:flutter_f2chat/components/schedule_data.dart';
import 'package:flutter_f2chat/components/schedule_item.dart';

class SchedulePage extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<SchedulePage> {
  ScrollController _controller = new ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: scheduleData.length,
        controller: _controller,
        itemBuilder: (context, index) {
      return ScheduleItem(scheduleData[index]);
    }));
  }
}
