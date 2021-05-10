import 'package:dashtech/application/student/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/pages/student/dashboard/widgets/activities/activities_list.dart';
import 'package:dashtech/presentation/pages/student/dashboard/widgets/dashboard_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboardPage extends GetView<DashboardController> {
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
