import 'package:dashtech/application/auth/signin_controller.dart';
import 'package:dashtech/presentation/shared/code_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SignInStepTwoCodeFields extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.signInCodeForm,
      onChanged: controller.checkFormValidity,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              controller.codes.length,
              (int index) => CodeField(
                fieldWidth: 45,
                fontSize: 28,
                controller: controller.codes[index],
                focusNode: controller.focusNodes[index],
                nextFocusNode:
                    (index == 5) ? null : controller.focusNodes[index + 1],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
