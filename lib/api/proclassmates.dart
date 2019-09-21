import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f2chat/models/schedule.dart';
import 'package:flutter_f2chat/models/users.dart';

class ProClassmates {
  ProClassmates([this.context]) {
    this._options = Options(extra: {'context': context});
  }

  BuildContext context;
  Options _options;

  static Dio dio = new Dio(BaseOptions(
    baseUrl: 'http://localhost:8000/',
  ));

  Future<List<Schedule>> getSchedule() async {
    var r = await dio.get<List>(
      "app_schedule",
      options: _options,
    );
    return r.data.map((e) => Schedule.fromJson(e)).toList();
  }

  Future<List<User>> getUser() async {
    var r = await dio.get<List>(
      'app_users',
      options: _options,
    );
    return r.data.map((e) => User.fromJson(e)).toList();
  }
}
