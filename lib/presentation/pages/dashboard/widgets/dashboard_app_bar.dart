import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      //shape: const CurvedShape(),
      automaticallyImplyLeading: false,
      centerTitle: false,
      // ignore: prefer_const_literals_to_create_immutables
      /*actions: [
        const Padding(
          padding: EdgeInsets.only(right: 25.0),
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://cinepassion34.fr/wp-content/uploads/2017/07/Chuck-Norris-cinepassion34.jpg',
              ),
              radius: 27,
            ),
          ),
        ),
      ],*/
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
              StringUtils.capitalize(
                  dashboardController.storageService.box.read('fullName'),
                  allWords: true),
              style: Get.textTheme.headline1.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              dashboardController.storageService.box.read('email'),
              style: Get.textTheme.subtitle2.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 2,
      bottom: TabBar(
        controller: dashboardController.tabController,
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
  Size get preferredSize => Size.fromHeight(80.0 + 20.0);
}
