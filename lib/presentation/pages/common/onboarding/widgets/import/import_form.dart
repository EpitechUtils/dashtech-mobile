import 'package:dashtech/application/common/onboarding/onboarding_controller.dart';
import 'package:dashtech/presentation/common/get_view_with_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ImportForm extends GetViewWithHook<OnboardingController> {
  static final GlobalKey<FormBuilderState> linkForm = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: linkForm,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          FormBuilderTextField(
            controller: controller.nameController,
            name: "form_name".tr,
            autocorrect: false,
            autofocus: true,
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(
                  context,
                  errorText: 'error_form_required'.tr,
                ),
              ],
            ),
            decoration: const InputDecoration(
              labelText: "Nom du profil",
            ),
          ),
          const SizedBox(height: 15),
          FormBuilderTextField(
            controller: controller.emailController,
            name: "form_email".tr,
            autocorrect: false,
            autofocus: false,
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
            decoration: InputDecoration(
              labelText: "Adresse e-mail",
              helperText: 'epitech_email_only'.tr,
            ),
          ),
        ],
      ),
    );
  }
}
