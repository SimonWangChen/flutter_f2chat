import 'package:flutter/material.dart';
import 'package:flutter_f2chat/global/global.dart';
import 'package:flutter_f2chat/i10n/localization_intl.dart';
import 'package:flutter_f2chat/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class Me extends StatefulWidget {
  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    var gm = GmLocalizations.of(context);
    UserModel userModel = Provider.of<UserModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Wrap(
          children: <Widget>[
            Container(
              child: Center(child: SizedBox(
                child: OutlineButton(onPressed: (){
                  showDialog(
                      context: context,
                      builder: (ctx) {
                    //退出账号前先弹二次确认窗
                    return AlertDialog(
                      content: Text(gm.logoutTip),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(gm.cancel),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlatButton(
                          child: Text(gm.yes),
                          onPressed: () {
                            //该赋值语句会触发MaterialApp rebuild
                            userModel.user = null;
                            Navigator.pushNamed(context,"login");
                          },
                        ),
                      ],
                    );
                  },
                  );}, child: Text(gm.logout.toUpperCase()),),
              )),
            ),
          ],
        ));
  }
}
