
import 'package:flutter/material.dart';
import 'package:v2ex/common/global_change_notifier.dart';

class Localized extends GlobalChangeNotifier {

  // 获取当前用户的APP语言配置Locale类，如果为null，则en_US
  Locale getLocale() {
    var locale = 'en_US';
    if (globalInfo.locale.isNotEmpty) {
      locale = globalInfo.locale;
    }
    var t = locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => globalInfo.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set change(String locale) {
    if (locale != globalInfo.locale) {
      globalInfo.locale = locale;
      notifyListeners();
    }
  }

   List<Locale> get supportedLocales {
    return const [
      Locale('en', 'US'), // 美国英语
      Locale('zh', 'CN'), // 中文简体
    ];
  }

  String dispalyName(String code) {
    switch (code) {
      case 'en_US':
        return 'English';
      case 'zh_CN':
        return '中文简体';
      default:
      return code;
    }
  }
}

class LocaleModel {
  String code;
  String name;
  LocaleModel({required this.code, required this.name});
}