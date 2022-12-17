import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class VLocalizations {
  static Future<VLocalizations> load(Locale locale) {
    String name = locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((value) {
      Intl.defaultLocale = localeName;
      return VLocalizations();
    });
  }

  static VLocalizations of(BuildContext context) {
    return Localizations.of<VLocalizations>(context, VLocalizations) ?? VLocalizations();
  }

  String get title {
    return Intl.message(
      'V2EX',
      name: 'title',
    );
  }

  /* 首页 */
  String get home {
    return Intl.message(
      "首页",
      name: 'home'
    );
  }

  /* 个人中心 */
  String get profile {
    return Intl.message(
      "我的",
      name: 'profile'
    );
  }

  String get setting {
    return Intl.message(
      "设置",
      name: 'setting'
    );
  }

  String get accountBalance {
    return Intl.message(
      "账户余额",
      name: 'accountBalance'
    );
  }

  String get post {
    return Intl.message(
      "发帖",
      name: 'post'
    );
  }

  String get theme {
    return Intl.message(
      "主题",
      name: 'theme'
    );
  }

  String get collection {
    return Intl.message(
      "收藏",
      name: 'collection'
    );
  }

  String get follow {
    return Intl.message(
      "关注",
      name: 'follow'
    );
  }

  String get recentBrowsing {
    return Intl.message(
      "最近浏览",
      name: 'recentBrowsing'
    );
  }

  String get languageSetting {
    return Intl.message(
      "设置语言",
      name: 'languageSetting'
    );
  }

  String get confirm {
    return Intl.message(
      "确定",
      name: 'confirm'
    );
  }

  String get cache {
    return Intl.message(
      "缓存",
      name: 'cache'
    );
  }

  String get exitLogin {
    return Intl.message(
      "退出登陆",
      name: 'exitLogin'
    );
  }
  
}