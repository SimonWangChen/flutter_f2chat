import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_f2chat/api/proclassmates.dart';
import 'package:flutter_f2chat/global/global.dart';

import 'event_detail.dart';

class CrateHostPage extends StatefulWidget {
  @override
  _CrateHostPageState createState() => _CrateHostPageState();
}

class _CrateHostPageState extends State<CrateHostPage> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Hosk'),
          elevation: 0.0,
        ),
        body: Center(
            child: FlatButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context, showTitleActions: true,
                      onConfirm: (date) {
                        var startTime = date.millisecondsSinceEpoch;
                        ProClassmates.hostEvent(
                            Global.profile.user.id, startTime.toString())
                            .then((e) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventDetail(
                                    schedule: e,
                                  )));
                        });
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  'Select A time to teach!',
                  style: TextStyle(color: Colors.blue),
                ))));
  }
}