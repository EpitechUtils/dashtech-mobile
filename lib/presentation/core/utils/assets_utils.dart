import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  static String profilePicture(String picture) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll([
      DotEnv().env['BASE_URL'],
      'userPicture',
      picture.replaceAll('.bmp', '') + '.jpg'
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
