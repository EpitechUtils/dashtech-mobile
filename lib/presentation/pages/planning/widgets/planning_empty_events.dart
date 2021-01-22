import 'package:dashtech/presentation/core/theme/app_fonts.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PlanningEmptyEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsUtils.svg('no-events'),
          width: Get.width / 2,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 130,
            left: 50,
            right: 50,
          ),
          child: Column(
            children: [
              Text(
                "Pas d'activités programmée",
                style: Get.textTheme.headline5,
              ),
              SizedBox(height: 10),
              Text(
                "Tu seras tranquille ce jour, un peu de repos !\nSeules les activités ou tu es inscrit(e) sont affichées ici.",
                textAlign: TextAlign.center,
                style: Get.textTheme.bodyText2,
              )
            ],
          ),
        ),
      ],
    );
  }
}
