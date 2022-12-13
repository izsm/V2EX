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
  
}