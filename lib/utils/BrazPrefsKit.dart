
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

// shared_preferences: ^0.4.2
class BrazPrefsKit {

  static Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  static Future<double> getDouble(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  static Future<Set<String>> getKeys() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getKeys() ?? [];
  }

  static Future<List<String>> getStringList(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  static Future<dynamic> get(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? {};
  }

  static Future<bool> set(String key, dynamic data) async {

    var prefs = await SharedPreferences.getInstance();

    switch (data.runtimeType.toString()){

      case PrefsKitType.BOOL:
        prefs.setBool(key, data);
        return true;
      case PrefsKitType.STRING:
        prefs.setString(key, data);
        return true;
      case PrefsKitType.INT:
        prefs.setInt(key, data);
        return true;
      case PrefsKitType.DOUBLE:
        prefs.setDouble(key, data);
        return true;
      case PrefsKitType.STRING_LIST:
        prefs.setStringList(key, data);
        return true;
      default:
        return false;
    }
  }
}

class PrefsKitType {

  static const String BOOL = "bool";
  static const String INT = "int";
  static const String DOUBLE = "double";
  static const String STRING = "String";
  static const String STRING_LIST = "JSArray<String>";

}