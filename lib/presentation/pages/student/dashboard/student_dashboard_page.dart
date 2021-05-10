import 'package:dashtech/application/student/dashboard/student_dashboard_controller.dart';
import 'package:dashtech/presentation/pages/student/dashboard/widgets/activities/activities_list.dart';
import 'package:dashtech/presentation/pages/student/dashboard/widgets/student_dashboard_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboardPage extends GetView<StudentDashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StudentDashboardAppBar(),
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
