import 'package:flutter/material.dart';

class ActivityColorUtils {
  static Color getColorByEventType(String type) {
    switch (type) {
      case 'rdv':
        {
          return Color(0xffffac33);
          break;
        }
      case 'other':
        {
          return Color(0xff00bcd4);
          break;
        }
      case 'class':
        {
          return Color(0xff1c54b2);
          break;
        }
      case 'tp':
        {
          return Color(0xff673ab7);
          break;
        }
      default:
        {
          return Colors.grey;
        }
    }
  }
}
