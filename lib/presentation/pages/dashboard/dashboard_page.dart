import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/pages/dashboard/widgets/activities/activities_list.dart';
import 'package:dashtech/presentation/pages/dashboard/widgets/dashboard_app_bar.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppBar(),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          ActivitiesList(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
