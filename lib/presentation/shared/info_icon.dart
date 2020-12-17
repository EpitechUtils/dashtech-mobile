import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';

class InfoIcon extends StatelessWidget {
  InfoIcon({
    @required this.icon,
    @required this.iconColor,
    @required this.label,
  });

  IconData icon;
  int iconColor;
  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 16,
              color: Color(iconColor),
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Text(
                label,
                style: Get.textTheme.bodyText1.copyWith(
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
