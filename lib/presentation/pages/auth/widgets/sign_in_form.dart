import 'package:dashtech/application/auth/signin_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

final GlobalKey<FormBuilderState> signinForm = GlobalKey<FormBuilderState>();

class SigninForm extends HookWidget {
  final SigninController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: signinForm,
      child: Column(
        children: [
          FormBuilderTextField(
            controller: _controller.emailTextController,
            name: "form_email".tr,
            autocorrect: false,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  context,
                  errorText: 'error_form_required'.tr,
                ),
                FormBuilderValidators.email(
                  context,
                  errorText: 'error_form_email'.tr,
                ),
                FormBuilderValidators.match(
                  context,
                  r"^[A-Za-z0-9._%+-]+@epitech.eu$",
                  errorText: 'error_form_email_epitech'.tr,
                )
              ],
            ),
            decoration: const InputDecoration(
              labelText: "Email",
              prefixIcon: Icon(
                LineIcons.at,
                color: Color(greyColor),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'epitech_email_only'.tr,
                style: FontStyles.baseFont.copyWith(
                  color: const Color(greyColor),
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
