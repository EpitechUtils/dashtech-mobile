import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleWithSubtitle extends StatelessWidget {
  TitleWithSubtitle({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: Get.textTheme.headline3,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          subtitle,
          textAlign: TextAlign.start,
          style: Get.textTheme.subtitle2,
        ),
      ),
    );
  }
}
