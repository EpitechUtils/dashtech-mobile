import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/custom_toast_widget.dart';

class ToastUtils {
  static void success(final String message) {
    showToastWidget(
      IconToastWidget.success(msg: message),
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.slideFromLeft,
      reverseAnimation: StyledToastAnimation.slideToRightFade,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn,
    );
  }

  static void error(final String message) {
    showToastWidget(
      IconToastWidget.error(msg: message),
      position: StyledToastPosition.top,
      animation: StyledToastAnimation.slideFromLeft,
      reverseAnimation: StyledToastAnimation.slideToRightFade,
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn,
    );
  }
}
