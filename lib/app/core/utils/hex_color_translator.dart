import 'dart:ui';

class HexColorTranslator {
  /// Convert string to hexa color
  static Color fromHex(String hexString) {
    return Color(int.parse(hexString.replaceAll('#', '').substring(0, 6), radix: 16) + 0xFF000000);
  }
}
