import 'package:flutter/material.dart';

class ScreenHelper {
  ScreenHelper({required this.context}) {
    screenSize = MediaQuery.of(context).size;
    height = screenSize!.height;
    width = screenSize!.width;
    isShortScreen = screenSize!.width <= 1000.0;
  }
  BuildContext context;
  Size? screenSize;
  late bool isShortScreen;
  late double height;
  late double width;
}
