import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icon_data.dart';

export 'fontawesome_type.dart';
export 'ionicons_type.dart';

class BrazFontKit {

  static IconData fontAwesomeIconData(int icon) {
    return FlutterIconData.fontAwesome(icon);
  }

  static IconData ionIconData(int icon) {
    return FlutterIconData.ionicons(icon);
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