import 'package:enum_to_string/enum_to_string.dart';
import 'package:epitech_intranet_mobile/app/core/enums/file_format_enum.dart';

class AssetsUtils {
  static String svg(String name) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(['assets', 'svg', name + '.' + EnumToString.parse(FileFormat.svg)], '/');
    return buffer.toString();
  }

  static String image(String name, [FileFormat format = FileFormat.png]) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(['assets', 'img', name + '.' + EnumToString.parse(format)], '/');
    return buffer.toString();
  }

  static String animation(String name) {
    final StringBuffer buffer = StringBuffer();
    buffer.writeAll(['assets', 'animations', '$name.json'], '/');
    return buffer.toString();
  }
}
