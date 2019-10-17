import 'dart:async';
import 'dart:io';

import 'package:brazkit/utils/BrazFileKit.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kReleaseMode;

class BrazAppKit {

  static const String ENVPATH = "assets/data/env.json";

  static Future<String> getValueFromEnvJson(String key) async {
    return BrazFileKit.loadJson(ENVPATH).then((map) => map[key]);
  }

  /// To be removed, use [BrazNetworKit] instead
  @Deprecated('It was moved to BrazNetworKit')
  static launchURL(String url) async {
    if (url.isEmpty) return;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<AppInfo> getAppInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return AppInfo(
      packageInfo.appName,
      packageInfo.buildNumber,
      packageInfo.version,
      packageInfo.packageName
    );
  }

  static void closeApp(){
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  static void debugPrint(String value){
    if (!kReleaseMode) {
      print(value);
    }
  }

}

class AppInfo {
  final appName;
  final buildNumber;
  final version;
  final packageName;
  AppInfo(this.appName, this.buildNumber, this.version, this.packageName);

  String toString(){
    return 'AppName: $appName, BuildNumber: $buildNumber, Version: $version, PackageName: $packageName';
  }
}