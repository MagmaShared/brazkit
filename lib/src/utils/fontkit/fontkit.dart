import 'package:flutter/material.dart';
import 'package:flutter_icons/ant_design.dart';
import 'package:flutter_icons/flutter_icon_data.dart';
import 'package:flutter_icons/font_awesome.dart';
import 'package:flutter_icons/ionicons.dart';

class FontKit {
  
  FontKit._privateConstructor();
  static final FontKit instance = FontKit._privateConstructor();

  Icon fontAwesomeIcon(int icon) {
    return Icon(FlutterIconData.fontAwesome(icon));
  }

  Icon getIcon(FontKitType type, String iconName) {

    switch (type) {
      case FontKitType.FONT_AWESOME: 
        return Icon(FontAwesome.getIconData(iconName));
        break;
      case FontKitType.ION_ICONS: 
        return Icon(Ionicons.getIconData(iconName));
        break;
      case FontKitType.ANT_DESIGN: 
        return Icon(AntDesign.getIconData(iconName));
        break;
      default:
        return Icon(FontAwesome.getIconData("dot-circle-o"));
    }
  }

  // FontKit.instance.fontAwesome(FontAwesomeType.star_o);

}

enum FontKitType {
  FONT_AWESOME,
  ION_ICONS,
  ANT_DESIGN
}

// Icon(MaterialIcons.getIconData("ac-unit"));