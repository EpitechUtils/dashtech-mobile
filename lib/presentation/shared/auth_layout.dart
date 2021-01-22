import 'package:dashtech/presentation/core/utils/keyboard_utils.dart';
import 'package:dashtech/presentation/shared/auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthLayout extends StatelessWidget {
  AuthLayout({@required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      allowFontScaling: true,
      designSize: const Size(1080, 2160),
    );

    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AuthAppBar(context),
          body: GestureDetector(
            onTap: () => KeyboardUtils.hide(context),
            child: child,
          ),
        ),
      ),
    );
  }
}
