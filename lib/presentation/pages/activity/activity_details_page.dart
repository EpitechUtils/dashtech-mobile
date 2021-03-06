import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/presentation/pages/activity/widgets/activity_details_content.dart';
import 'package:dashtech/presentation/pages/activity/widgets/shared/activity_details_base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailsPage extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isLoading.value,
        child: Scaffold(appBar: ActivityDetailsBaseAppBar()),
        replacement: ActivityDetailsContent(),
      ),
    );
  }
}
