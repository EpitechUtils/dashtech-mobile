import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YearDropdown extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down),
        value: controller.filterYear.value,
        iconSize: 24,
        elevation: 16,
        style: Get.textTheme.subtitle2!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        underline: Container(
          height: 1,
          color: Color(primaryColor),
        ),
        onChanged: (String? val) => controller.filterYear.value = val!,
        items: ['2020']
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
