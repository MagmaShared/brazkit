import 'package:brazkit/utils/layoutkit/BrazLayoutKit.dart';
import 'package:flutter/material.dart';


class BrazGlobalPosition {

  static Offset getTopLeft(GlobalKey key){
    return BrazLayoutKit.getGlobalPositionPoint(key);
  }

  static Offset getTopCenter(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(offsetValues.size.width / 2, 0);
  }

  static Offset getTopRight(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(offsetValues.size.width, 0);
  }

  static Offset getCenter(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(offsetValues.size.width / 2, offsetValues.size.height / 2);
  }

  static Offset getLeft(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(0, offsetValues.size.height / 2);
  }

  static Offset getRight(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(offsetValues.size.width, offsetValues.size.height / 2);
  }

  static Offset getBottomLeft(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(0, offsetValues.size.height);
  }

  static Offset getBottomRight(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(offsetValues.size.width, offsetValues.size.height);
  }

  static Offset getBottomCenter(GlobalKey key){
    OffsetValues offsetValues = BrazLayoutKit.getGlobalOffsetValues(key);
    return offsetValues.offset.translate(offsetValues.size.width / 2, offsetValues.size.height);
  }

}