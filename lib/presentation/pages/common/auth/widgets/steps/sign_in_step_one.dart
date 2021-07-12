import 'package:animate_do/animate_do.dart';
import 'package:dashtech/application/common/auth/signin_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/theme/app_fonts.dart';
import 'package:dashtech/presentation/pages/common/auth/widgets/sign_in_form.dart';
import 'package:dashtech/presentation/common/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInStepOne extends GetView<SigninController> {
  Future<void> sendEmailCode() async {
    if (controller.signInForm.currentState!.saveAndValidate()) {
      await controller.sendEmailCode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      delay: const Duration(milliseconds: 200),
      child: Column(
        children: [
          SigninForm(),
          const SizedBox(height: 30),
          Obx(
            () => RoundedButton(
              onPressed: sendEmailCode,
              isLoading: controller.isLoading.value,
              label: 'signin'.tr,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'email_signin_process'.tr,
                style: FontStyles.baseFont.copyWith(
                  color: const Color(greyColor),
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
