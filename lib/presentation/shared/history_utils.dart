import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HistoryUtils {
  static Icon getIconByType(String type) {
    switch (type) {
      case 'new':
        return Icon(
          LineIcons.plus,
          color: Color(successColor),
          size: 30,
        );

      case 'delete':
        return Icon(
          LineIcons.times,
          color: Color(errorColor),
          size: 30,
        );

      case 'replace':
        return Icon(
          LineIcons.pen,
          color: Color(warnColor),
          size: 30,
        );

      default:
        return Icon(
          LineIcons.question,
          color: Color(greyColor),
          size: 30,
        );
    }
  }

  static String getEventDescription(String type) {
    switch (type) {
      case 'new':
        return 'Association d\'une nouvelle carte';

      case 'delete':
        return 'Suppression de la carte';

      case 'replace':
        return 'Remplacement de la carte par une autre';

      default:
        return "Status inconnu";
    }
  }
}
