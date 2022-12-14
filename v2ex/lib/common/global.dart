import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'adapt.dart';
import 'global_info.dart';

class Global {

  static late SharedPreferences _prefs;
  static GlobalInfo globalInfo = GlobalInfo();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    //顶部状态栏透明
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    _prefs = await SharedPreferences.getInstance();
    var globalInfoString = _prefs.getString("GlobalInfoKey");
    if (globalInfoString != null) {
      try {
        globalInfo = GlobalInfo.fromJson(jsonDecode(globalInfoString));
      // ignore: empty_catches
      } catch (e) {}
    }
    
    Adapt.init(375);
  }

  static saveGlobalInfo() {
    _prefs.setString("GlobalInfoKey", jsonEncode(globalInfo.toJson()));
  }
}
