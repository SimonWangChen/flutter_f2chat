import 'package:flutter/material.dart';
import 'package:flutter_f2chat/global/global.dart';
import 'package:flutter_f2chat/i10n/localization_intl.dart';
import 'package:flutter_f2chat/pages/app.dart';
import 'package:flutter_f2chat/pages/language.dart';
import 'package:flutter_f2chat/pages/login.dart';
import 'package:flutter_f2chat/pages/me.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'states/profile_change_notifier.dart';

void main() => Global.init().then((e) => runApp(MyApp())) ;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer<LocaleModel>(
        builder: (BuildContext context, localeModel, Widget child) {
          return MaterialApp(
            onGenerateTitle: (context) {
              return GmLocalizations.of(context).title;
            },
            home: AppPage(),
            debugShowCheckedModeBanner: false,
            locale: localeModel.getLocale(),
            //我们只支持美国英语和中文简体
            supportedLocales: [
              const Locale('en', 'US'), // 美国英语
              const Locale('zh', 'CN'), // 中文简体
              //其它Locales
            ],
            localizationsDelegates: [
              // 本地化的代理类
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GmLocalizationsDelegate()
            ],
            localeResolutionCallback:
                (Locale _locale, Iterable<Locale> supportedLocales) {
              if (localeModel.getLocale() != null) {
                //如果已经选定语言，则不跟随系统
                return localeModel.getLocale();
              } else {
                //跟随系统
                Locale locale;
                if (supportedLocales.contains(_locale)) {
                  locale = _locale;
                } else {
                  //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                  locale = Locale('en', 'US');
                }
                return locale;
              }
            },
            // 注册路由表
            routes: <String, WidgetBuilder>{
              "login": (context) => Login(),
              "language": (context) => LanguageRoute(),
              "userprofile": (context) => Me(),
            },
          );
        },
      ),
    );

  }
}
