import 'package:flutter/material.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import '../common/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // 全局修改去除点击水波纹效果
        // brightness: Brightness.light,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      // localizationsDelegates: const [
      //   // 本地化的代理类
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en', 'US'), // 美国英语
      //   Locale('zh', 'CN'), // 中文简体
      // ],
      debugShowCheckedModeBanner: false,
    );
  }
}