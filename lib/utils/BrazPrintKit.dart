import 'dart:io';

class BrazPrintKit {

  static error(Object text){
    /// iOS VSCode incompatibility
    if (Platform.isIOS) return print('[ERROR]: ' + text);

    print('\x1B[31m[ERROR]\x1B[0m $text');
  }

  static customColor(String text, int color256){
    /// iOS VSCode incompatibility
    if (Platform.isIOS) return print(text);

    print('\u001b[38;5;${color256}m$text');
  }

  static log(String text, {BrazPrintColor color, int backgroundColor256}){

    /// iOS VSCode incompatibility
    if (Platform.isIOS) return print('[LOG]: ' + text);

    if (backgroundColor256 != null) return print('\u001b[41m[LOG] ${text.toUpperCase()}');

    final String c = BrazPrintKit.getColorInt(color).toString();
    print('\x1B[' + c + 'm[LOG] \x1B[0m${text.toUpperCase()}');
  }

  static warn(Object text){
    /// iOS VSCode incompatibility
    if (Platform.isIOS) return print('[WARN]: ' + text);

    print('\x1B[93m[WARN]\x1B[0m $text');
  }

  static debug(Object text){
    /// iOS VSCode incompatibility
    if (Platform.isIOS) return print('[DEBUG]: ' + text);

    print('\x1B[94m[DEBUG]\x1B[0m $text');
  }

  static int getColorInt(BrazPrintColor printColor){
    switch (printColor) {
      case BrazPrintColor.RED:
        return 31;
      case BrazPrintColor.BLUE:
        return 94;
      case BrazPrintColor.YELLOW:
        return 93;
      case BrazPrintColor.GREEN:
        return 92;
      case BrazPrintColor.CYAN:
        return 36;
      case BrazPrintColor.WHITE:
        return 97;
      case BrazPrintColor.BLACK:
        return 30;
      case BrazPrintColor.MAGENTA:
        return 95;
      case BrazPrintColor.GRAY:
        return 90;
      default:
        return 97;
    }
  }

  static void prettyPrintList(Iterable iter) {
    if (iter == null) return;

    final buff = StringBuffer();
    var isFirst = true;

    buff.write('[');

    for (final val in iter) {
      if (!isFirst) buff.write(', ');
      isFirst = false;
      if (val is String) {
        buff.write('"$val"');
      } else {
        buff.write(val.toString());
      }
    }

    buff.write(']');

    print(buff.toString());
  }

}

enum BrazPrintColor {
  RED,
  BLUE,
  YELLOW,
  GREEN,
  WHITE,
  BLACK,
  MAGENTA,
  GRAY,
  CYAN
}