import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f2chat/models/activity.dart';
import 'package:flutter_f2chat/models/schedule.dart';
import 'package:flutter_f2chat/models/users.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_f2chat/global/host.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProClassmates {
  ProClassmates([this.context]) {
    this._options = Options(extra: {'context': context});
  }

  BuildContext context;
  Options _options;
  static SharedPreferences _prefs;
  static String _token;
  static Dio dio = new Dio(BaseOptions(
    baseUrl: host,
  ));

  static void init() async {
    _prefs = await SharedPreferences.getInstance();
    _token = _prefs.getString('token');

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async {
        if (_token == null) {
          print("no token，request token firstly...");
          //lock the dio.
          dio.lock();
          return getToken().then((r) {
            options.headers["Authorization"] = "jwt " + r;
            return options;
          }).whenComplete(() => dio.unlock());
        } else {
          options.headers["Authorization"] = "jwt " + _token;
          return options;
        }
      },
    ));
  }

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

  static  Future<User> getUserDetail(int userId) async {
    var r = await dio.get(
      'app_user_detail/?id=$userId',

    );
    return User.fromJson(r.data[0]);
  }

  Future<User> login({Map<String, dynamic> queryParameters}) async {
    try {
      //先获取jwt
      dio.lock();
      String token = await getToken(queryParameters: queryParameters);
      dio.unlock();

      //获取用户信息
      var r = await dio.get(
        'app_user_detail/2/',
        options: Options(headers: {"Authorization": "jwt " + token}),
      );
//      print(r.data);
      return User.fromJson(r.data);
    } catch (err) {
      print(err);
    }
  }

  static Future getActivity(page, size) async {
    var r = await dio.get(
      'app_activity/?page=$page&size=$size',
    );
    return r.data.map((e) => Activity.fromJson(e)).toList();
  }
  
  static Future hostEvent(int host, String startTime) async{
    var r = await dio.post(
      'app_schedule/',
      data: {"host":host,"start_time":startTime}
    );
    return Schedule.fromJson(r.data);
  }
}

Future getToken({Map<String, dynamic> queryParameters}) async {
  try {
    var r = await http.post(
      host + 'login/',
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: jsonEncode(queryParameters),
    );
    if (r.statusCode == 200) {
      var jsonResponse = jsonDecode(r.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonResponse['token']);
      return jsonResponse['token'];
    } else {
      print("Request failed with status: ${r.statusCode}.");
    }
  } catch (err) {
    return print(err);
  }
}
