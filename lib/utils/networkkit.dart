import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:url_launcher/url_launcher.dart';

class NetworkKit {

  static StreamSubscription<dynamic> _subscription;

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  static checkConnection(Function(ConnectivityResult) onConnectivity) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    onConnectivity(connectivityResult);
  }

  static subscribeConnectivityChanged(Function(ConnectivityResult) onChange) {
    _subscription = Connectivity().onConnectivityChanged.listen(onChange);
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

}