import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/filters/filter_promo.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoDropdown extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<FilterPromo>(
        icon: Icon(Icons.keyboard_arrow_down),
        value: controller.filterPromo.value,
        iconSize: 24,
        elevation: 16,
        style: Get.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        underline: Container(
          height: 1,
          color: Color(primaryColor),
        ),
        onChanged: (FilterPromo? val) {
          controller.filterPromo.value = val!;
          controller.fetchProfilesByFilters();
        },
        items: buildDropdowns(),
      ),
    );
  }

  List<DropdownMenuItem<FilterPromo>>? buildDropdowns() {
    if (controller.filterIsLoading[Filter.PROMOS] == true) {
      return [
        DropdownMenuItem<FilterPromo>(
          value: null,
          child: Text(
            'loading'.tr,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Color(greyColor),
              fontSize: 14,
            ),
          ),
        )
      ];
    }

    return [
      DropdownMenuItem<FilterPromo>(
        value: null,
        child: Text(
          'select'.tr,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color(greyColor),
            fontSize: 14,
          ),
        ),
      ),
      ...controller.filterPromos
          .map<DropdownMenuItem<FilterPromo>>(
            (FilterPromo value) => DropdownMenuItem<FilterPromo>(
              value: value,
              child: Text(
                value.promo,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          )
          .toList(),
    ];
  }
}
