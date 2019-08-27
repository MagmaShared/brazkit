import 'package:flutter/services.dart';

class BrazFileKit {

  static dynamic loadString(String pathFile) async {
    return await rootBundle.loadString(pathFile);
  }


}