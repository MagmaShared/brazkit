import 'package:flutter/material.dart';

class BrazWidgetKit {
  static void dismissFocus(BuildContext context) {
    // FocusScope.of(context).requestFocus(new FocusNode());
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static double getAppBarHeight(BuildContext context){
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return statusbarHeight + kToolbarHeight;
  }
}
