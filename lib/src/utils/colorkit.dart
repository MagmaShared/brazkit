import 'package:flutter/material.dart';

class ColorKit {

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
// ColorPalette();

  static Color toColor(String color) {
//    Color color = new Color(0x12345678);
//    String colorString = color.toString(); // Color(0x12345678)
    String valueString = color.split('(0x')[1].split(')')[0]; // kind of hacky..
    int value = int.parse(valueString, radix: 16);
    return new Color(value);
  }

  static String toHex(Color color) {
    return '#' + (color.toString().replaceFirst('Color(0xff', '').replaceFirst(')', '')).toUpperCase();
  }
}