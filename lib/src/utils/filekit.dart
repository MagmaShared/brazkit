import 'package:flutter/services.dart';

class FileKit {

  static dynamic loadString(String pathFile) async {
    return await rootBundle.loadString(pathFile);
  }


}