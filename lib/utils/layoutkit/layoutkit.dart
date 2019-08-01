import 'package:flutter/material.dart';
export 'global_position.dart';

/*
* Use inside initState() before super.initState()
* WidgetsBinding.instance.addPostFrameCallback(FrameCallback callback);
* */

class LayoutKit {

  static Size getSize(GlobalKey key) {
    final RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox?.size;
  }

  static Offset getGlobalPositionPoint(GlobalKey key) {
    final RenderBox renderBox = key.currentContext.findRenderObject();
    return renderBox?.localToGlobal(Offset.zero);
  }

  static OffsetValues getGlobalOffsetValues(GlobalKey key){
    Offset offset = LayoutKit.getGlobalPositionPoint(key);
    Size size = LayoutKit.getSize(key);
    return OffsetValues(offset, size);
  }

}

class OffsetValues {

  final Offset offset;
  final Size size;

  OffsetValues(this.offset, this.size);
}
