import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FontStyles {
  static const TextStyle futuraFont = TextStyle(
    fontFamily: 'Futura',
    color: Color(blackColor),
  );

  static const TextStyle baseFont = TextStyle(
    fontFamily: 'Avenir',
    fontSize: 14,
  );

  static TextStyle get primaryButton => futuraFont.copyWith(
        fontSize: 16,
        color: Color(secondaryBtnColor),
        fontWeight: FontWeight.bold,
      );

  static TextStyle get secondaryButton => futuraFont.copyWith(
        fontSize: 16,
        color: Color(primaryBtnColor),
        fontWeight: FontWeight.bold,
      );

  static TextStyle get title => futuraFont.copyWith(
        fontSize: 16,
      );

  static TextStyle get smallTitle => futuraFont.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: const Color(textColor),
      );

  static TextStyle get headline1 => futuraFont.copyWith(
        fontFamily: 'Somatic',
        fontSize: 23,
        color: const Color(textColor),
      );
}
