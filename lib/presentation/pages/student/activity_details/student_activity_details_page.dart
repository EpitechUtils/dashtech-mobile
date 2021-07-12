import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/activity_details_content.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/common/activity_details_base_app_bar.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/common/activity_details_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentActivityDetailsPage extends GetView<StudentActivityController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isLoading.value,
        child: Scaffold(
          appBar: ActivityDetailsBaseAppBar(),
          body: ActivityDetailsShimmer(),
        ),
        replacement: ActivityDetailsContent(),
      ),
    );
  }
}
