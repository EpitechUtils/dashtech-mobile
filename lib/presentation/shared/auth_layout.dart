import 'package:dashtech/presentation/core/utils/keyboard_utils.dart';
import 'package:dashtech/presentation/shared/auth_app_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  AuthLayout({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
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
