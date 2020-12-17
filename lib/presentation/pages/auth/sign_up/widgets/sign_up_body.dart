import 'package:flutter_file_store/application/auth/signup_controller.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_up/widgets/sign_up_form.dart';
import 'package:flutter_file_store/presentation/routes/app_pages.dart';
import 'package:flutter_file_store/presentation/shared/auth_title_redirect.dart';
import 'package:flutter_file_store/presentation/shared/auth_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupBody extends GetView<SignupController> {
  void goToSignin() => Get.offAllNamed(Routes.signin);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: [
            AuthTitleSubtitle(
              title: 'i_signup'.tr,
              subtitle: 'singning_up'.tr,
            ),
            const SizedBox(height: 50),
            SignupForm(),
          ],
        ),
        AuthTitleRedirect(
          title: 'already_have_account'.tr,
          buttonLabel: 'to_connect'.tr,
          onTap: goToSignin,
        ),
      ],
    );
  }
}
