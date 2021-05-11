import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/admin_card_app_bar.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/course_dropdown.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/promo_dropdown.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/search_fields.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/trombi_user_display.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/trombi_users_shimmer.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/year_dropdown.dart';
import 'package:dashtech/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminCardPage extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminCardAppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SearchFields(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => Visibility(
                  visible: !controller.isLoading.value,
                  replacement: TrombiUsersShimmer(),
                  child: ListView.builder(
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) =>
                        TrombiUserDisplay(controller.users[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
