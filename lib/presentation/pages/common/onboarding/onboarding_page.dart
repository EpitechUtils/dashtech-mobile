import 'package:dashtech/presentation/common/layouts/auth_layout.dart';
import 'package:dashtech/presentation/common/rounded_button.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: _bottomNavigation(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigation(BuildContext context) {
    return Column(
      children: [
        RoundedButton(
          onPressed: () {},
          secondary: true,
          label: 'Associer mon compte',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 100, child: Divider(thickness: 2)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'OU',
                  style: TextStyle(
                    color: Color(textColor),
                  ),
                ),
              ),
              SizedBox(width: 100, child: Divider(thickness: 2)),
            ],
          ),
        ),
        RoundedButton(
          onPressed: () {},
          label: 'Importer un compte existant',
        ),
      ],
    );
  }
}
