import 'dart:io';

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

  static bool existsDirectorySync(String path) {

    if (path.startsWith('/')) path = path.substring(1);
    if (path.endsWith('/')) path = path.substring(0, path.length - 1);

    if (Directory('lib/$path').existsSync()) {
      return true;
    } else return false;
  }
  
  static File createFile(String path, String content) {
    try {
      
      var file = File(path)
        ..createSync(recursive: true)
        ..writeAsStringSync(content);
      return file;
    } catch (e) {
      return null;
    }
  }

  File existsFileInDirectory(Directory directory, String fileName) {
    try {
      var file = directory.listSync().firstWhere((f) => f is File && f.path.endsWith(fileName));
      return file;
    } catch (e) {
      return null;
    }
  }
  
}