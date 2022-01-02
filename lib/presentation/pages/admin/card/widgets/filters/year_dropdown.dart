import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YearDropdown extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<
          CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>(
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
        onChanged: (val) {
          controller.filterYear.value = val!;
          controller.filterCourse.value = null;
          controller.filterPromo.value = null;
          controller.getFilterByName(Filter.COURSES);
        },
        items: buildDropdowns(),
      ),
    );
  }

  List<
          DropdownMenuItem<
              CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>>?
      buildDropdowns() {
    if (controller.filterIsLoading[Filter.YEARS] == true) {
      return [
        DropdownMenuItem<
            CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>(
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
      DropdownMenuItem<
          CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>(
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
      ...controller.filterYears
          .map<
              DropdownMenuItem<
                  CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>>(
            (value) => DropdownMenuItem<
                CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>(
              value: value,
              child: Text(
                value.scolaryear,
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
