import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:connectivity/connectivity.dart';

class BrazNetworkKit {

  static StreamSubscription<dynamic> _subscription;

  static Future<bool> isConnected({Function(bool) callback}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (callback != null) callback(false);
      return false;
    } else {
      if (callback != null) callback(true);
      return true;
    }
  }

  static checkConnection(Function(ConnectivityResult) onConnectivity) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    onConnectivity(connectivityResult);
  }

  static subscribeConnectivityChanged(Function(ConnectivityResult) onChange) {
    try {
    _subscription = Connectivity().onConnectivityChanged.listen(onChange);
    } catch (e) {
      print(e);
    }
  }

  static unSubscribeConnectivityChanged(){
    if (_subscription != null) _subscription.cancel();
  }

  static void searchGoogle(String word) async {
    String url = 'https://www.google.com/search?q=' + Uri.encodeComponent(word);
    if (await canLaunch(url))
      launch(url);
    else
      print('url invalida');
  }

  static launchURL(String url) async {
    if (url.isEmpty) return;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
