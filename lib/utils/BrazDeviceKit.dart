//import 'package:device_id/device_id.dart';
import 'package:flutter/material.dart';

class BrazDeviceKit {

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