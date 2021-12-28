import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class OnboardingCarouselItem extends StatelessWidget {
  OnboardingCarouselItem({required this.svg, required this.title});

  final String svg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.7,
      child: Column(
        children: [
          SvgPicture.asset(
            AssetsUtils.svg(svg),
            width: Get.width * 0.5,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Get.textTheme.headline1!.copyWith(fontSize: 23),
          ),
        ],
      ),
    );
  }
}
