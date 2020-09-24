import 'package:basic_utils/basic_utils.dart';

class NumberUtils {
  static bool isNumeric(String value) {
    if (StringUtils.isNullOrEmpty(value)) {
      return false;
    }
    return double.tryParse(value) != null || int.tryParse(value) != null;
  }

  static bool isInteger(String value) {
    if (StringUtils.isNullOrEmpty(value)) {
      return false;
    }
    return int.tryParse(value) != null;
  }
}
