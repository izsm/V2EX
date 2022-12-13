import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:v2ex/common/localized.dart';
import 'package:v2ex/i10n/localization_delegate.dart';
import 'package:v2ex/i10n/localization_intl.dart';
import '../common/routers.dart';
import 'common/global.dart';

void main() {
  Global.init().then((e) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Localized())
      ],
      child: Consumer<Localized>(
        builder: (context, localized, child) {
          return MaterialApp(
            // APP的标题。在Android系统中，APP的标题会出现在任务管理器中
            onGenerateTitle: (context) {
              return VLocalizations.of(context).title;
            },
            theme: ThemeData(
              // 全局修改去除点击水波纹效果
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent
            ),
            themeMode: ThemeMode.system,
            initialRoute: '/',
            onGenerateRoute: onGenerateRoute,
            locale: localized.getLocale(),
            localizationsDelegates: const [
              // 本地化的代理类
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              VLocalizationsDelegate()
            ],
            supportedLocales: localized.supportedLocales,
            // 监听locale改变的事件
            localeResolutionCallback: (locale, supportedLocales) {
              return localized.getLocale();
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}