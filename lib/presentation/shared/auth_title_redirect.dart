import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTitleRedirect extends StatelessWidget {
  AuthTitleRedirect({
    @required this.title,
    @required this.buttonLabel,
    @required this.onTap,
  });

  String title;
  String buttonLabel;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  title,
                  style: Get.textTheme.subtitle1,
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => onTap(),
                  child: Text(
                    buttonLabel,
                    style: Get.textTheme.headline2.copyWith(
                      color: const Color(primaryColor),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            )
          ],
        ),
      ],
    );
  }
}
