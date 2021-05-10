import 'package:dashtech/application/shared/home/home_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/admin/dashboard/admin_dashboard_page.dart';
import 'package:dashtech/presentation/pages/admin/home/widgets/admin_bottom_bar_widget.dart';
import 'package:dashtech/presentation/pages/shared/settings/settings_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends GetView<HomeController> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(fillColor),
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (int index) => controller.onPageChanged(index),
        children: <Widget>[
          AdminDashboardPage(),
          Container(),
          Container(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => AdminBottomBar(
          index: controller.index.value,
          onTap: (int index) => controller.onPageChanged(index),
        ),
      ),
    );
  }
}
