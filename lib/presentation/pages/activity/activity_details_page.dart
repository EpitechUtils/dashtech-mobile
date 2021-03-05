import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/presentation/pages/activity/widgets/activity_details_content.dart';
import 'package:dashtech/presentation/pages/activity/widgets/activity_details_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailsPage extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActivityDetailsAppBar(),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Obx(
          () => Visibility(
            visible: controller.isLoading.value,
            child: Container(),
            replacement: ActivityDetailsContent(),
          ),
        ),
      ),
    );
  }
}
