import 'package:flutter/material.dart';
export 'package:flutter_icons/src/flutter_icon_data.dart';
import 'package:flutter_icons/flutter_icons.dart';
export 'fontawesome_type.dart';
export 'ionicons_type.dart';

class BrazFontKit {

  static IconData fontAwesomeIconData(int icon) {
    return FlutterIconData.fontAwesome(icon);
  }

  static IconData fontAwesome5IconData(int icon, {IconWeight weight = IconWeight.Solid}) {
    return FlutterIconData.fontAwesome5(icon, weight: weight);
  }

  static IconData ionIconData(int icon) {
    return FlutterIconData.ionicons(icon);
  }

  static IconData antDesign(int icon) {
    return FlutterIconData.antDesign(icon);
  }
}

enum BrazFontKitType {
  FONT_AWESOME,
  ION_ICONS,
  ANT_DESIGN,
  ENTYPO,
  EVIL_ICONS,
  FEATHER,
  FOUNDATION,
  MATERIAL_COMMUNITY_ICONS,
  MATERIAL_ICONS,
  OCT_ICONS,
  SIMPLE_LINE_ICONS,
  ZOCIAL
}

// Icon(MaterialIcons.getIconData("ac-unit"));