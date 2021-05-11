import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/student/dashboard/student_dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/shared/cached_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboardAppBar extends GetView<StudentDashboardController>
    implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.transparent,
            child: CachedCircleAvatar(
              noPicture: Image.asset(
                AssetsUtils.image('unknown', FileFormat.jpg),
                width: 30,
              ),
              imagePath: AssetsUtils.profilePicture(
                  controller.storageService.box.read('email')),
              radius: 45,
            ),
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringUtils.capitalize(
                  controller.storageService.box.read('fullName'),
                  allWords: true),
              style: Get.textTheme.headline1!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              controller.storageService.box.read('email'),
              style: Get.textTheme.subtitle2!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 2,
      bottom: TabBar(
        controller: controller.tabController,
        tabs: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Activités"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Projets"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Modules"),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0 + 35.0);
}
