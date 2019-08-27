import 'package:flutter/cupertino.dart';

class BrazWidgetKit {

  static void dismissFocus(BuildContext context){
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}