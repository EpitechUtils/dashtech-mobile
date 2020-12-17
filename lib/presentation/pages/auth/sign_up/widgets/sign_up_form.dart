import 'package:flutter_file_store/application/auth/signup_controller.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_up/widgets/sign_up_kind_card.dart';
import 'package:flutter_file_store/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupForm extends GetView<SignupController> {
  void onSelect(SignupKind kind) {
    switch (kind) {
      case SignupKind.restorer:
        {
          Get.toNamed(Routes.signup_restorer);
          break;
        }
      case SignupKind.user:
        {
          Get.toNamed(Routes.signup_user);
          break;
        }
      case SignupKind.unset:
        {
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'which_user'.tr,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SignupKindCard(
          title: 'restorer'.tr,
          desc: 'restorer_desc'.tr,
          img: 'restorer',
          kind: SignupKind.restorer,
          select: () => onSelect(SignupKind.restorer),
        ),
        const SizedBox(
          height: 20,
        ),
        SignupKindCard(
          title: 'user'.tr,
          desc: 'user_desc'.tr,
          img: 'client',
          kind: SignupKind.user,
          select: () => onSelect(SignupKind.user),
        ),
      ],
    );
  }
}
