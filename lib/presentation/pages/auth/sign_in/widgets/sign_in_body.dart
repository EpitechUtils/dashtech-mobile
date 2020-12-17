import 'package:flutter_file_store/application/auth/signin_controller.dart';
import 'package:flutter_file_store/presentation/core/icons/cajole_icons.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/theme/app_fonts.dart';
import 'package:flutter_file_store/presentation/core/utils/keyboard_utils.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_in/widgets/sign_in_form.dart';
import 'package:flutter_file_store/presentation/routes/app_pages.dart';
import 'package:flutter_file_store/presentation/shared/auth_title_redirect.dart';
import 'package:flutter_file_store/presentation/shared/auth_title_subtitle.dart';
import 'package:flutter_file_store/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninBody extends GetView<SigninController> {
  Future<void> signin() async {
    if (signinForm.currentState.saveAndValidate()) {
      await controller.login();
    }
  }

  void goToSignup() => Get.offAllNamed(Routes.signup);

  @override
  Widget build(BuildContext context) {
    final bool keyboardIsOpen = KeyboardUtils.isShowing(Get.context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AuthTitleSubtitle(
          title: 'i_connect'.tr,
          subtitle: 'has_already_account'.tr,
        ),
        const SizedBox(height: 30),
        SigninForm(),
        const SizedBox(height: 30),
        Obx(
          () => RoundedButton(
            onPressed: signin,
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
    );
  }
}
