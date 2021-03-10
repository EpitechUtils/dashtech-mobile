import 'package:animate_do/animate_do.dart';
import 'package:dashtech/application/splash/splash_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/shared/hooks/use_get_package_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class SplashPage extends HookWidget {
  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    final PackageInfo packageInfo = useGetPackageInfo();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Container(
      color: Color(primaryColor),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            color: Color(primaryColor),
            child: Stack(
              children: <Widget>[
                Align(
                  child: FadeInUp(
                    delay: const Duration(seconds: 1),
                    child: SvgPicture.asset(
                      AssetsUtils.svg('logo_block'),
                      color: Colors.white,
                      width: Get.width / 3,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      packageInfo != null ? 'v${packageInfo.version}' : '',
                      style: Get.textTheme.headline2.copyWith(
                        color: Colors.white,
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
