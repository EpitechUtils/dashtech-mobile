import 'package:flutter_file_store/application/auth/signin_controller.dart';
import 'package:flutter_file_store/presentation/core/icons/cajole_icons.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/theme/app_fonts.dart';
import 'package:flutter_file_store/presentation/core/utils/keyboard_utils.dart';
import 'package:flutter_file_store/presentation/pages/auth/forgot/forgot_page.dart';
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
    final ValueNotifier<bool> _passwordVisible = useState<bool>(false);
    final bool keyboardIsOpen = KeyboardUtils.isShowing(Get.context);
    return FormBuilder(
      key: signinForm,
      child: Column(
        children: [
          FormBuilderTextField(
            controller: _controller.emailTextController,
            attribute: "form_email".tr,
            autocorrect: false,
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            validators: [
              FormBuilderValidators.required(
                  errorText: 'error_form_required'.tr),
              FormBuilderValidators.email(errorText: 'error_form_email'.tr),
              FormBuilderValidators.pattern(r"^[A-Za-z0-9._%+-]+@epitech.eu$",
                  errorText: 'error_form_email_epitech'.tr)
            ],
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
