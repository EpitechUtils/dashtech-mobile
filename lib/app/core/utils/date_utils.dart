import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';

class DateUtils {
  static String getDayDifferenceFromNow(final DateTime date) {
    final dateNow = DateTime.now();
    final difference = date.difference(dateNow).inDays;
    if (difference == 0) {
      return translate(Keys.Date_Today);
    }
    if (difference == 1) {
      return translate(Keys.Date_Tomorrow);
    }
    if (difference == -1) {
      return translate(Keys.Date_Yesterday);
    }
    if (difference == 2) {
      return translate(Keys.Date_In_Two_Days);
    }
    if (difference == -2) {
      return translate(Keys.Date_Two_Days_Ago);
    }
    return DateFormat('dd/MM/yy').format(date);
  }
}
