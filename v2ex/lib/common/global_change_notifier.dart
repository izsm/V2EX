import 'package:flutter/material.dart';
import 'package:v2ex/common/global.dart';
import 'package:v2ex/common/global_info.dart';

class GlobalChangeNotifier extends ChangeNotifier {

  GlobalInfo get globalInfo => Global.globalInfo;

  @override
  void notifyListeners() {
    // 保存GlobalInfo变更
    Global.saveGlobalInfo();
     //通知依赖的Widget更新
    super.notifyListeners();
  }
}