import 'package:flutter/cupertino.dart';

class WidgetKit {

  static void dismissFocus(BuildContext context){
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}