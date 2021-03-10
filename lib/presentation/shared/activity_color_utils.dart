import 'package:flutter/material.dart';

class ActivityColorUtils {
  static Color getColorByEventType(String type, {double opacity = 1}) {
    switch (type) {
      case 'rdv':
        return Color(0xffffac33).withOpacity(opacity);

      case 'other':
        return Color(0xff00bcd4).withOpacity(opacity);

      case 'class':
        return Color(0xff1c54b2).withOpacity(opacity);

      case 'tp':
        return Color(0xff673ab7).withOpacity(opacity);

      case 'exam':
        return Color(0xffe74c3c).withOpacity(opacity);

      default:
        return Colors.grey.withOpacity(opacity);
    }
  }
}
