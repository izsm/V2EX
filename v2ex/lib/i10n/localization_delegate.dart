import 'package:flutter/material.dart';
import 'localization_intl.dart';

class VLocalizationsDelegate extends LocalizationsDelegate<VLocalizations> {

  const VLocalizationsDelegate();

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<VLocalizations> load(Locale locale) {
    return VLocalizations.load(locale);
  }
  
  // //是否支持某个Local
  @override
  bool isSupported(Locale locale) {
    return [
      'zh',
      'en'
    ].contains(locale.languageCode);
  }
  
  // 当Localizations Widget重新build时，是否调用load重新加载Locale资源.
  @override
  bool shouldReload(VLocalizationsDelegate old) {
    return false;
  }

}