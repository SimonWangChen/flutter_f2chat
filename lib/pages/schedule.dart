import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter_f2chat/api/proclassmates.dart';

import 'package:flutter_f2chat/components/schedule_item.dart';
import 'package:flutter_f2chat/models/schedule.dart';

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
        child: InfiniteListView<Schedule>(
      onRetrieveData: (int page, List<Schedule> items, bool refresh) async {
        var data = await ProClassmates(context).getSchedule();
        //把请求到的新数据添加到items中
        items.addAll(data);
        return data.length > 0 && data.length % 20 == 0;
      },
      itemBuilder: (List list, int index, BuildContext ctx) {
        // 项目信息列表项
        return ScheduleItem(list[index]);
      },
    ));
  }
}
