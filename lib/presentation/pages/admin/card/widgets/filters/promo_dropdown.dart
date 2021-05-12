import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoDropdown extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down),
        value: controller.filterPromo.value,
        iconSize: 24,
        elevation: 16,
        style: Get.textTheme.subtitle2!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        underline: Container(
          height: 1,
          color: Color(primaryColor),
        ),
        onChanged: (String? val) => controller.filterPromo.value = val!,
        items: ['tek1', 'tek2', 'tek3']
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
