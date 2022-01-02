import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/keyboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseLayout extends StatelessWidget {
  BaseLayout({
    required this.child,
    required this.title,
    this.bottomNavigationBar,
  });

  final String title;
  final Widget child;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          splashRadius: 20,
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(textColor),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: Get.textTheme.headline1!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
      extendBody: true,
      body: GestureDetector(
        onTap: () => KeyboardUtils.hide(context),
        child: SafeArea(child: child),
      ),
    );
  }
}
