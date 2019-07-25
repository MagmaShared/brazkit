import 'package:flutter/material.dart';

class NavKit {

  static dynamic push(BuildContext context, Widget page) async {
    return await Navigator.push(context, MaterialPageRoute(builder : (context) => page ));
  }

  static dynamic pushReplacement(BuildContext context, Widget page) async {
    return await Navigator.pushReplacement(context, MaterialPageRoute(builder : (context) => page ));
  }

  static void pop(BuildContext context){
    Navigator.pop(context);
  }
}