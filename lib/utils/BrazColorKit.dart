import 'package:flutter/material.dart';

class BrazColorKit {

  static MaterialColor getDarker1(MaterialColor color) {
    return color[100];
  }

  static MaterialColor getDarker2(MaterialColor color) {
    return color[300];
  }

  static MaterialColor getDarker3(MaterialColor color) {
    return color[500];
  }

  static MaterialColor getLighter1(MaterialColor color) {
    return color[100];
  }

  static MaterialColor getLighter2(MaterialColor color) {
    return color[300];
  }

  static MaterialColor getLighter3(MaterialColor color) {
    return color[500];
  }

  static Color colorStringToColor(String color) {
//    Color color = new Color(0x12345678);
//    String colorString = color.toString(); // Color(0x12345678)
    String valueString = color.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    return new Color(value);
  }

  static String colorToHex(Color color) {
    return '#' + (color.toString().replaceFirst('Color(0xff', '').replaceFirst(')', '')).toUpperCase();
  }

  static String colorToHex2(Color color) {
    return color.value.toRadixString(16);
  }

  static Color hexToColor(String code) {
    return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static int hexToColor2(String hexColor) {
    hexColor = hexColor?.toUpperCase()?.replaceAll("#", "") ?? "DEDEDE";
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

}