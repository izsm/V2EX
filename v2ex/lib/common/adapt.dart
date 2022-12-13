// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'dart:ui';

class Adapt {
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double width = mediaQuery.size.width;
  static double height = mediaQuery.size.height;
  static double topbarH = mediaQuery.padding.top;
  static double botbarH = mediaQuery.padding.bottom;
  static double pixelRatio = mediaQuery.devicePixelRatio;
  static var ratio;

  static init(number) {
      int uiwidth = number is int ? number : 375;
      ratio = width / uiwidth;
  }
  static fit(number) {
      if(!(ratio is double || ratio is int)) {
        Adapt.init(375);
      }
      return number * ratio;
  }
}

extension AdaptInt on int {

  double get fit {
    return Adapt.fit(this);
  }
}

extension AdaptDouble on double {

  double get fit {
    return Adapt.fit(this);
  }
}