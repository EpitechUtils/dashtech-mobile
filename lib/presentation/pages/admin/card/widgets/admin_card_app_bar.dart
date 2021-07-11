import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminCardAppBar extends GetView<AdminCardController> implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "admin_card_title".tr,
              style: Get.textTheme.headline1!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "admin_card_subtitle".tr,
              overflow: TextOverflow.fade,
              style: Get.textTheme.subtitle2!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}
