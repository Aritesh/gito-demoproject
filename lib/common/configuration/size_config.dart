import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockWidth = 0;
  static double _blockHeight = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;
  static double heightMultiplier;
  static double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (_screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }
//    if (Platform.isAndroid) {
//      _blockHeight = _screenHeight / 100;
//    } else if (Platform.isIOS) {
//      _blockHeight = _screenHeight / 80;
//    }
    if (_screenHeight > 1000) {
      _blockWidth = _screenWidth / 110 / 2;
      _blockHeight = _screenHeight / 110 / 2;
    } else {
      _blockWidth = _screenWidth / 100 / 2;
      _blockHeight = _screenHeight / 100 / 2;
    }

    textMultiplier = _blockHeight + _blockWidth;
  }
}
