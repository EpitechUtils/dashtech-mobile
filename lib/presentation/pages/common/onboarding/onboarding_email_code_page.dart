import 'package:dashtech/application/common/onboarding/onboarding_controller.dart';
import 'package:dashtech/presentation/common/layouts/base_layout.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/keyboard_utils.dart';
import 'package:dashtech/presentation/pages/common/onboarding/widgets/code_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingEmailCodePage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = KeyboardUtils.isShowing(context);

    return BaseLayout(
      title: 'Code de verification',
      child: WillPopScope(
        onWillPop: () {
          controller.resetFields();
          return Future.value(true);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 12,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'signin_mail_sent_1'.tr,
                    style: Get.textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      color: const Color(blackColor),
                    ),
                    children: [
                      TextSpan(
                        text: ' ${controller.emailController.text}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(
                () => Visibility(
                  visible: !controller.isLoading.value,
                  child: Column(
                    children: [
                      CodeFields(),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'signin_mail_sent_2'.tr,
                            style: Get.textTheme.bodyText1!.copyWith(
                              color: const Color(greyColor),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  replacement: const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(primaryColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
