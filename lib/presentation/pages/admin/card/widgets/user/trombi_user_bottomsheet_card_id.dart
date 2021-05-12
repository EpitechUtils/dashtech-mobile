import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrombiUserBottomSheetCardId extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 60,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: InkWell(
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            onTap: () {},
            splashColor: const Color(primaryColor).withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Identifiant de Carte",
                    style: Get.textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    controller.userCardResult.value!.card == null
                        ? "Non associée"
                        : controller.userCardResult.value!.card!.nfcTag,
                    style: Get.textTheme.headline3!.copyWith(
                      fontSize: 14,
                      color: Color(
                        controller.userCardResult.value!.card == null
                            ? warnColor
                            : successColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
