import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                child: _shimmerText(70),
                replacement: Text(
                  controller.isLoading.value
                      ? ""
                      : controller.activity.value.title,
                  style: Get.textTheme.headline1.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => Visibility(
                visible: controller.isLoading.value,
                child: _shimmerText(140),
                replacement: Text(
                  controller.isLoading.value
                      ? ""
                      : controller.activity.value.module_title,
                  style: Get.textTheme.subtitle2.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 0,
    );
  }

  Widget _shimmerText(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300].withOpacity(0.5),
      highlightColor: Colors.grey[200].withOpacity(0.6),
      child: Container(
        margin: const EdgeInsets.only(bottom: 5),
        width: width,
        height: 15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}
