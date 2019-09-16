import 'dart:async';
import 'dart:io';

import 'package:brazkit/utils/BrazFileKit.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class BrazAppKit {

  static const String ENVPATH = "assets/data/env.json";

  // enviroments
  static String getEnviroment(String key) => Platform.environment[key];
  static bool isAndroid(String key) => Platform.isAndroid;
  static bool isIos(String key) => Platform.isIOS;

  static Future<String> getValueFromEnvJson(String key) async {
    return BrazFileKit.loadJson(ENVPATH).then((map) => map[key]);
  }

  static launchURL(String url) async {
    if (url.isEmpty) return;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<PackageInfo> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }

  static void closeApp(){
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

}