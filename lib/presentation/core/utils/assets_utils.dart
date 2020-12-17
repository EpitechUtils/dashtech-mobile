import 'package:enum_to_string/enum_to_string.dart';

enum FileFormat { png, jpg, json, gif, svg }

class AssetsUtils {
  static String svg(String name) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll([
      'assets',
      'svg',
      '$name.${EnumToString.convertToString(FileFormat.svg)}'
    ], '/');
    return buffer.toString();
  }

  static String image(String name, [FileFormat format = FileFormat.png]) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll([
      'assets',
      'img',
      '$name.${EnumToString.convertToString(format)}',
    ], '/');
    return buffer.toString();
  }

  static String animation(String name) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll([
      'assets',
      'animations',
      '$name.json',
    ], '/');
    return buffer.toString();
  }
}
