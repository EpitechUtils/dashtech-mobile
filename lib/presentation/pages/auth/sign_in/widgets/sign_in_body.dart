import 'package:flutter_file_store/application/auth/signin_controller.dart';
import 'package:flutter_file_store/presentation/core/icons/cajole_icons.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/theme/app_fonts.dart';
import 'package:flutter_file_store/presentation/core/utils/keyboard_utils.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_in/widgets/sign_in_form.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_in/widgets/steps/sign_in_step_one.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_in/widgets/steps/sign_in_step_two.dart';
import 'package:flutter_file_store/presentation/routes/app_pages.dart';
import 'package:flutter_file_store/presentation/shared/auth_title_redirect.dart';
import 'package:flutter_file_store/presentation/shared/auth_title_subtitle.dart';
import 'package:flutter_file_store/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninBody extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AuthTitleSubtitle(
          title: 'i_connect'.tr,
          subtitle: 'has_already_account'.tr,
        ),
        const SizedBox(height: 30),
        Obx(
          () => Visibility(
            visible: !controller.isWaitingForCode.value,
            child: SignInStepOne(),
            replacement: SignInStepTwo(),
          ),
        )
      ],
    );
  }
}
