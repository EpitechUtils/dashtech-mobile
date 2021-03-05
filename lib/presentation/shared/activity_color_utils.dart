import 'package:flutter/material.dart';

class ActivityColorUtils {
  static Color getColorByEventType(String type, {double opacity = 1}) {
    switch (type) {
      case 'rdv':
        {
          return Color(0xffffac33).withOpacity(opacity);
          break;
        }
      case 'other':
        {
          return Color(0xff00bcd4).withOpacity(opacity);
          break;
        }
      case 'class':
        {
          return Color(0xff1c54b2).withOpacity(opacity);
          break;
        }
      case 'tp':
        {
          return Color(0xff673ab7).withOpacity(opacity);
          break;
        }
      case 'exam':
        {
          return Color(0xffdf6f3d).withOpacity(opacity);
          break;
        }
      default:
        {
          return Colors.grey.withOpacity(opacity);
        }
    }
  }
}
