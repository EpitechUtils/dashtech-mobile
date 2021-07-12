import 'package:dashtech/application/common/auth/signin_webview_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SingInIntranetSyncing extends GetView<SigninWebviewController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: <Widget>[
          Lottie.asset(
            AssetsUtils.animation('fireworks'),
            width: 250,
          ),
          Text(
            'synchronization'.tr,
            textAlign: TextAlign.center,
            style: Get.textTheme.headline1,
          ),
          const SizedBox(height: 10),
          Text(
            'synchronization_desc'.tr,
            textAlign: TextAlign.center,
            style: Get.textTheme.bodyText1!.copyWith(
              fontSize: 15,
              color: const Color(blackColor),
            ),
          ),
        ],
      ),
    );
  }
}
