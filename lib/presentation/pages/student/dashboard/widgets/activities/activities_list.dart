import 'package:dashtech/application/student/dashboard/student_activities_controller.dart';
import 'package:dashtech/application/student/dashboard/student_dashboard_controller.dart';
import 'package:dashtech/presentation/pages/student/dashboard/widgets/activities/activities_list_shimmer.dart';
import 'package:dashtech/presentation/pages/student/dashboard/widgets/activities/activity_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivitiesList extends GetView<StudentActivitiesController> {
  final StudentDashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: !controller.showShimmer.value,
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () => controller.fetchActivities(true),
          child: ListView.builder(
            itemCount: controller.activities.length + 1,
            itemBuilder: (BuildContext c, int index) {
              if (index == controller.activities.length) {
                return SizedBox(height: 120);
              }

              return ActivityCard(
                weekActivity: controller.activities[index],
                index: index,
              );
            },
          ),
        ),
        replacement: ActivitiesListShimmer(),
      ),
    );
  }
}
