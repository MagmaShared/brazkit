import 'package:flutter/services.dart';
import 'dart:convert';

class BrazFileKit {

  static dynamic loadString(String pathFile) async {
    return await rootBundle.loadString(pathFile);
  }

  static Future<Map> loadJson(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return json.decode(jsonString);
  }

}