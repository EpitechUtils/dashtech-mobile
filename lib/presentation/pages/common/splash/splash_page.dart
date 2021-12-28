import 'package:animate_do/animate_do.dart';
import 'package:dashtech/application/common/splash/splash_controller.dart';
import 'package:dashtech/presentation/common/get_view_with_hook.dart';
import 'package:dashtech/presentation/common/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetViewWithHook<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: FadeInUp(
                    delay: const Duration(seconds: 1),
                    child: Logo(size: 60),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Obx(
                      () => Text(
                        'v${controller.version()} (build ${controller.build()}) - ${controller.flavor()}',
                        style: Get.textTheme.headline2!.copyWith(fontSize: 13),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
