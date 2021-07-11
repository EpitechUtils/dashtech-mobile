import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/filters/filter_course.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDropdown extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButton<CardGetFilterValues$Query$FilterDetails$Course>(
          icon: Icon(Icons.keyboard_arrow_down),
          value: controller.filterCourse.value,
          iconSize: 24,
          elevation: 16,
          style: Get.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
          underline: Container(
            height: 1,
            color: Color(primaryColor),
          ),
          onChanged: (val) {
            controller.filterCourse.value = val!;
            controller.filterPromo.value = null;
            controller.getFilterByName(Filter.PROMOS);
          },
          items: buildDropdowns()),
    );
  }

  List<DropdownMenuItem<CardGetFilterValues$Query$FilterDetails$Course>>? buildDropdowns() {
    if (controller.filterIsLoading[Filter.COURSES] == true) {
      return [
        DropdownMenuItem<CardGetFilterValues$Query$FilterDetails$Course>(
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
      DropdownMenuItem<CardGetFilterValues$Query$FilterDetails$Course>(
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
      ...controller.filterCourses
          .map<DropdownMenuItem<CardGetFilterValues$Query$FilterDetails$Course>>(
            (value) => DropdownMenuItem<CardGetFilterValues$Query$FilterDetails$Course>(
              value: value,
              child: Text(
                value.code,
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
