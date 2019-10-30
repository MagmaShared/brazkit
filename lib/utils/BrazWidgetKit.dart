import 'package:flutter/material.dart';
class BrazWidgetKit {
  static void dismissFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
