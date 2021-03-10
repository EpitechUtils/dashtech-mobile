import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return Container(
      height: (Get.height / 3) * 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      width: (Get.width / 3) * 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            AssetsUtils.animation('qr_code'),
            width: Get.width / 2,
          ),
          const SizedBox(height: 30),
          Text(
            "available_soon".tr,
            style: Get.textTheme.headline1,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: (Get.width / 3) * 2,
            child: Text(
              "available_soon_text".tr,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline2,
            ),
          )
        ],
      ),
    );
  }
}
