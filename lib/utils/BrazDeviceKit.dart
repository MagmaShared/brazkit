//import 'package:device_id/device_id.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class BrazDeviceKit {

  // enviroments
  static String getEnviroment(String key) => Platform.environment[key];
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIos => Platform.isIOS;

  static String get operatingSystem => Platform.operatingSystem;  
  static Map<String, String> get environment => Platform.environment;  
  static String get localeName => Platform.localeName;  
  static String get localHostname => Platform.localHostname;  
  static int get numberOfProcessors => Platform.numberOfProcessors;  
  static String get operatingSystemVersion => Platform.operatingSystemVersion;  
  static String get packageConfig => Platform.packageConfig;  
  static String get resolvedExecutable => Platform.resolvedExecutable;  
  static String get version => Platform.version;

  static double getHalfScreenProportion(BuildContext context){
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return itemWidth / itemHeight;
  }

  // static Future<String> getDeviceId() async {
    // return await FlutterUdid.udid;
  // }

//  static Future<String> getImei() async {
//    return await DeviceId.getIMEI;
//  }
}