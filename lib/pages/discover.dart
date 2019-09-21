import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';
import 'package:flutter_f2chat/api/proclassmates.dart';
import 'package:flutter_f2chat/components/user_item.dart';

import 'package:flutter_f2chat/models/users.dart';

class MatePage extends StatefulWidget {
  @override
  _MateState createState() => _MateState();
}

class _MateState extends State<MatePage> {
  ScrollController _controller = new ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: InfiniteListView<User>(
          onRetrieveData: (int page, List<User> items, bool refresh) async {
            var data = await ProClassmates(context).getUser();
            //把请求到的新数据添加到items中
            items.addAll(data);
            return data.length > 0 && data.length % 20 == 0;
          },
          itemBuilder: (List list, int index, BuildContext ctx) {
            // 项目信息列表项
            return UserItem(list[index]);
          },
        ));
  }
}

