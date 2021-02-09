import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static var screenWidth;
  static var screenHeight;
  static var defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}


getProportionateScreenHeight(var inputHeight) {
  var screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
}

getProportionateScreenWidth(var inputWidth) {
  var  screenWidth = SizeConfig.screenWidth;
  return (inputWidth / 375.0) * screenWidth;
}