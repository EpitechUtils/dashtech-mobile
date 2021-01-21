import 'package:dashtech/presentation/pages/dashboard/widgets/activity/activities_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/activities_controller.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/pages/dashboard/widgets/activity/activity_card.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivitiesList extends GetView<ActivitiesController> {
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !controller.showShimmer.value,
      child: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: controller.fetchActivities,
        child: ListView.builder(
          itemCount: controller.activities.length,
          itemBuilder: (BuildContext c, int index) {
            return ActivityCard(
              weekActivity: controller.activities[index],
              index: index,
            );
          },
        ),
      ),
      replacement: ActivitiesListShimmer(),
    );
  }
}
