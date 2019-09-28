import 'package:flutter/material.dart';
import 'package:flutter_f2chat/api/proclassmates.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:flutter_f2chat/components/activity_item.dart';

Dio dio = new Dio();

class ActivityPage extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<ActivityPage> {
  ScrollController _scrollController = new ScrollController();
  int _page = 1;
  int _size = 5;

  var posts = [];

  @override
  void initState() {
    super.initState();
    // 首次拉取数据
    _getPostData(true);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _addMoreData();
      }
    });
  }

  void _getPostData(bool _beAdd) async {
    var result = await ProClassmates.getActivity(_page, _size);

    setState(() {
      if (!_beAdd) {
        posts.clear();
        posts = result;
      } else {
        posts.addAll(result);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    _page = 0;
    _getPostData(false);
  }

  // 上拉加载数据
  Future<Null> _addMoreData() async {
    _page++;
    _getPostData(true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: Container(
        color: Colors.grey[100],
        child: StaggeredGridView.countBuilder(
          controller: _scrollController,
          itemCount: posts.length,
          primary: false,
          crossAxisCount: 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          itemBuilder: (context, index) => ActivityCard(posts[index]),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        ),
      ),
    );
  }
}
