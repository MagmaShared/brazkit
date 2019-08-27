
import 'package:flutter/material.dart';

class BrazPageKit {

  static dynamic push(BuildContext context, Widget page) async {
    return await Navigator.push(context, MaterialPageRoute(builder : (context) => page ));
  }

  static dynamic pushReplacement(BuildContext context, Widget page) async {
    return await Navigator.pushReplacement(context, MaterialPageRoute(builder : (context) => page ));
  }
}