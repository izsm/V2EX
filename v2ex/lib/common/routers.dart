// Flutter widgets implementing Material Design
import 'package:flutter/material.dart';

// Flutter widgets implementing the current iOS design language
// import 'package:flutter/cupertino.dart';
import 'package:v2ex/main/main_page.dart';
import '../classes/profile/modular/language/language_page.dart';

// 1、配置路由
final Map routes = {
  '/': (context) => const MainPage(),
  '/language': (context) => const LanguagePage()
};

// 2、配置onGenerateRoute 固定写法 这个方法也相当于一个中间件，这里可以做权限判断
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];

  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};