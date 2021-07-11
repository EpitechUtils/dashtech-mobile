import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/admin_card_app_bar.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/filters/search_fields.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_display.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_empty_list.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_users_shimmer.dart';
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
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => Visibility(
                  visible: !controller.isLoading.value,
                  replacement: TrombiUsersShimmer(),
                  child: (() {
                    if (controller.users.isEmpty) return TrombiUserEmptyList();

                    return ListView.builder(
                      itemCount: controller.users.length,
                      itemBuilder: (context, index) => TrombiUserDisplay(controller.users[index]),
                    );
                  })(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
