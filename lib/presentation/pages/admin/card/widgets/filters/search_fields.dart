import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/filters/course_dropdown.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/filters/promo_dropdown.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/filters/year_dropdown.dart';
import 'package:dashtech/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFields extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            YearDropdown(),
            CourseDropdown(),
            PromoDropdown(),
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => RoundedButton(
            height: 40,
            isLoading: controller.isLoading.value,
            onPressed: controller.fetchProfilesByFilters,
            label: 'Afficher la liste des Etudiants',
          ),
        ),
      ],
    );
  }
}
