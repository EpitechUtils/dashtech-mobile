import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ActivityDetailsBaseAppBar extends GetView<StudentActivityController>
    implements PreferredSizeWidget {
  ActivityDetailsBaseAppBar({this.actions, this.bottom});

  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.0 + (bottom != null ? 50 : 0),
      automaticallyImplyLeading: false,
      centerTitle: false,
      leading: IconButton(
        onPressed: Get.back,
        icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
      ),
      leadingWidth: 30,
      actions: actions != null ? actions : [],
      title: Padding(
        padding: const EdgeInsets.only(
          right: 20,
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
                  controller.isLoading.value ? "" : controller.activity.value!.typeTitle!,
                  style: Get.textTheme.headline1!.copyWith(
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
                  controller.isLoading.value ? "" : controller.activity.value!.title!,
                  overflow: TextOverflow.fade,
                  style: Get.textTheme.subtitle2!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 2,
      bottom: bottom,
    );
  }

  Widget _shimmerText(double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!.withOpacity(0.5),
      highlightColor: Colors.grey[200]!.withOpacity(0.6),
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
  Size get preferredSize => Size.fromHeight(70.0 + (bottom != null ? 50 : 0));
}
