import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTitleSubtitle extends StatelessWidget {
  AuthTitleSubtitle({
    required this.title,
    required this.subtitle,
  });

  String title;
  String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 0),
      title: Text(
        subtitle,
        style: Get.textTheme.headline2,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          title,
          style: Get.textTheme.headline1,
        ),
      ),
    );
  }
}
