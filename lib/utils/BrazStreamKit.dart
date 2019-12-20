import 'dart:async';

import 'package:flutter/material.dart';

class BrazStreamKit {

  static Timer runCancelableTimer(Timer oldTimer, VoidCallback callback, {Duration duration = const Duration(seconds: 5)}) {
    if (oldTimer?.isActive ?? false) oldTimer?.cancel();
    oldTimer = null;
    return Timer(duration, callback);
  }
  
}