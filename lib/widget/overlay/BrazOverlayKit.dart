import 'package:flutter/material.dart';

class BrazOverlayKit {
  
  static Widget getWaitScreen() {
    return Stack(
      children: [
        new Opacity(
          opacity: 0.3,
          child: const ModalBarrier(dismissible: false, color: Colors.grey),
        ),
        new Center(
          child: new CircularProgressIndicator(),
        ),
      ],
    );
  }
}