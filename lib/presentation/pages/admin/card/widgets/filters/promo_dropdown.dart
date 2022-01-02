import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PromoDropdown extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          DropdownButton<CardGetFilterValues$Query$FilterDetailsType$PromoType>(
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
        onChanged: (val) {
          controller.filterPromo.value = val!;
          controller.fetchProfilesByFilters();
        },
        items: buildDropdowns(),
      ),
    );
  }

  List<DropdownMenuItem<CardGetFilterValues$Query$FilterDetailsType$PromoType>>?
      buildDropdowns() {
    if (controller.filterIsLoading[Filter.PROMOS] == true) {
      return [
        DropdownMenuItem<CardGetFilterValues$Query$FilterDetailsType$PromoType>(
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
      DropdownMenuItem<CardGetFilterValues$Query$FilterDetailsType$PromoType>(
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
          .map<
              DropdownMenuItem<
                  CardGetFilterValues$Query$FilterDetailsType$PromoType>>(
            (value) => DropdownMenuItem<
                CardGetFilterValues$Query$FilterDetailsType$PromoType>(
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
