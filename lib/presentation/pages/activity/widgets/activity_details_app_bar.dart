import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:get/get.dart';

class ActivityDetailsAppBar extends GetView<ActivityController>
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          left: 10,
          top: 10,
        ),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.activity == null
                    ? ""
                    : controller.activity.value.acti_title,
                style: Get.textTheme.headline1.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                controller.activity == null
                    ? ""
                    : controller.activity.value.titlemodule,
                style: Get.textTheme.subtitle2.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}
