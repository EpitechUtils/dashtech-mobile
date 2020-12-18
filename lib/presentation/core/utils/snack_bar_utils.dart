import 'dart:async';

import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_store/presentation/core/utils/keyboard_utils.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SnackBarUtils {
  static void success({
    @required String message,
    String title = 'success',
    Function onClose,
  }) {
    final bool keyboardIsOpen = KeyboardUtils.isShowing(Get.context);

    Get.snackbar(
      _translateIt(title),
      _translateIt(message),
      backgroundColor: const Color(successColor),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(
          horizontal: 10, vertical: keyboardIsOpen ? 20 : 0),
      icon: Lottie.asset(
        AssetsUtils.animation('success'),
        height: 30,
        width: 30,
        repeat: false,
      ),
    );
    if (!onClose.isNull) {
      Timer(const Duration(seconds: 3), () => onClose());
    }
  }

  static void info({
    @required String message,
    String title = 'info',
    Function onClose,
  }) {
    final bool keyboardIsOpen = KeyboardUtils.isShowing(Get.context);

    Get.snackbar(
      _translateIt(title),
      _translateIt(message),
      backgroundColor: const Color(infoColor),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      overlayBlur: 0,
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(
          horizontal: 10, vertical: keyboardIsOpen ? 20 : 0),
      icon: Lottie.asset(
        AssetsUtils.animation('success'),
        height: 30,
        width: 30,
        repeat: false,
      ),
    );
    if (!onClose.isNull) {
      Timer(const Duration(seconds: 3), () => onClose());
    }
  }

  static void error({
    @required String message,
    String title = "error",
    Function onClose,
  }) {
    final bool keyboardIsOpen = KeyboardUtils.isShowing(Get.context);

    Get.snackbar(
      _translateIt(title),
      _translateIt(message),
      backgroundColor: const Color(errorColor),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.symmetric(
          horizontal: 10, vertical: keyboardIsOpen ? 20 : 0),
      icon: Lottie.asset(
        AssetsUtils.animation('error'),
        height: 50,
        width: 50,
        repeat: false,
      ),
    );
    if (!onClose.isNull) {
      Timer(const Duration(seconds: 3), () => onClose());
    }
  }

  static String _translateIt(String msg) => msg.tr;
}
