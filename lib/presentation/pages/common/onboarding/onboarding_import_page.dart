import 'package:dashtech/presentation/common/layouts/base_layout.dart';
import 'package:dashtech/presentation/common/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingImportPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      bottomNavigationBar: _bottomNavigation(context),
      title: 'Importer un compte existant',
      child: Container(),
    );
  }

  Widget _bottomNavigation(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: RoundedButton(
          onPressed: () {},
          label: 'Importer ce compte',
        ),
      ),
    );
  }
}
