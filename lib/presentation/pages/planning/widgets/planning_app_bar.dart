import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:get/get.dart';

class PlanningAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      //shape: const CurvedShape(),
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
            Text(
              'Planning',
              style: Get.textTheme.headline1.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Consultes ton planning et organises-toi au mieux !',
              style: Get.textTheme.subtitle2.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}
