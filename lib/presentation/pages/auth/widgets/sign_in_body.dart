import 'package:dashtech/application/auth/signin_controller.dart';
import 'package:dashtech/presentation/pages/auth/widgets/steps/sign_in_step_one.dart';
import 'package:dashtech/presentation/pages/auth/widgets/steps/sign_in_step_two.dart';
import 'package:dashtech/presentation/shared/auth_title_subtitle.dart';
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
