import 'package:dashtech/application/common/onboarding/onboarding_controller.dart';
import 'package:dashtech/presentation/common/layouts/base_layout.dart';
import 'package:dashtech/presentation/common/rounded_button.dart';
import 'package:dashtech/presentation/pages/common/onboarding/widgets/import/import_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingLinkPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      bottomNavigationBar: _bottomNavigation(context),
      title: 'Associer mon compte',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            ImportForm(),
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmailCode() async {
    if (OnboardingController.linkForm.currentState!.saveAndValidate()) {
      await controller.sendEmailCode();
    }
  }

  Widget _bottomNavigation(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => RoundedButton(
            onPressed: _sendEmailCode,
            isLoading: controller.isLoading(),
            label: 'Associer ce compte',
          ),
        ),
      ),
    );
  }
}
