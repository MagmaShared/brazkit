import 'dart:convert';
import 'dart:math';

class BrazStringKit {

  static bool isNotEmpty(String text){
    if (text?.isNotEmpty ?? false){
      if (text.trim().isNotEmpty) return true;
    }
    return false;
  }

  static bool isEmptyOrNull(String text){
    if (text?.isEmpty ?? true) return true;
    else if (text.trim().isEmpty) return true;
    return false;
  }

  static bool isNegativeUntype(dynamic obj){
    if (obj.runtimeType.toString() == 'String') (obj as String).trim().toString();
    return ["", null, false, 0].contains(obj);
  }

  static String createRandomStringB64([int length = 32]) {
    var values = List<int>.generate(length, (i) => Random.secure().nextInt(256));
    return base64Url.encode(values);
  }
  
}