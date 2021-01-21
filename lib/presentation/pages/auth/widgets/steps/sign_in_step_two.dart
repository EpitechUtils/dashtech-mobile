import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_store/application/auth/signin_controller.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/theme/app_fonts.dart';
import 'package:flutter_file_store/presentation/core/utils/assets_utils.dart';
import 'package:flutter_file_store/presentation/core/utils/keyboard_utils.dart';
import 'package:flutter_file_store/presentation/pages/auth/widgets/sign_in_form.dart';
import 'package:flutter_file_store/presentation/pages/auth/widgets/steps/sign_in_step_two_code_fields.dart';
import 'package:flutter_file_store/presentation/shared/rounded_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignInStepTwo extends GetView<SigninController> {
  Future<void> sendEmailCode() async {
    if (signinForm.currentState.saveAndValidate()) {
      await controller.sendEmailCode();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = KeyboardUtils.isShowing(Get.context);

    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Column(
        children: [
          SvgPicture.asset(
            AssetsUtils.svg('email'),
            width: Get.width / 3,
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 20),
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 12,
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'signin_mail_sent_1'.tr,
                style: Get.textTheme.bodyText1.copyWith(
                  fontSize: 15,
                  color: const Color(blackColor),
                ),
                children: [
                  TextSpan(
                    text: ' ${controller.emailTextController.text}',
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
                  SignInStepTwoCodeFields(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'signin_mail_sent_2'.tr,
                        style: FontStyles.baseFont.copyWith(
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
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Color(primaryColor)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Obx(
            () => Visibility(
              visible: !controller.isLoading.value && !keyboardIsOpen,
              child: RoundedButton(
                onPressed: controller.resetFields,
                label: 'previous'.tr,
              ),
            ),
          )
        ],
      ),
    );
  }
}
