import 'package:flutter/material.dart';

extension C on Color {
  static Color black = Colors.black;
  // 黑色2
  static Color c222222 = '#222222'.color;
  // 黑色6
  static Color c666666 = '#666666'.color;
  // 黑色8
  static Color c999999 = '#999999'.color;
  // 线
  static Color line = '#dfe0e0'.color;
  // 导航栏、tabbar
  static Color bar(BuildContext context) {
    return isDarkMode(context) ? '1A222C'.color : Colors.white;
  }
  // 背景色
  static Color background(BuildContext context) {
    return isDarkMode(context) ? '25303E'.color : 'E2E2E2'.color;
  }
  // 列表等
  static Color list(BuildContext context) {
    return isDarkMode(context) ? '1A222C'.color : Colors.white;
  }

  Color alpha(double value) {
    return withOpacity(value);
  }
}

extension StringColor on String {
  Color get color {
    String hex = replaceAll("#", "");
    if (hex.isEmpty) hex = "ffffff";
    if (hex.length == 3) {
      hex = '${hex.substring(0, 1)}${hex.substring(0, 1)}${hex.substring(1, 2)}${hex.substring(1, 2)}${hex.substring(2, 3)}${hex.substring(2, 3)}';
    }
    Color col = Color(int.parse(hex, radix: 16)).withOpacity(1.0);
    return col;
  }
}

// bool get isDarkMode {
//   return SchedulerBinding.instance.window.platformBrightness == Brightness.dark;
// }

bool isDarkMode(BuildContext context) {
  return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
}