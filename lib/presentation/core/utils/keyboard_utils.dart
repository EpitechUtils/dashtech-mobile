import 'package:flutter/cupertino.dart';

class KeyboardUtils {
  static void hide(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static bool isShowing(BuildContext context) =>
      !(MediaQuery.of(context).viewInsets.bottom == 0.0);
}
