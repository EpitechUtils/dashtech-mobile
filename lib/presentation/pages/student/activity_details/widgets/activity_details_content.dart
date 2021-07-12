import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/multiple_activities/multiple_event_activity.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/single_activity/single_event_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityDetailsContent extends GetView<StudentActivityController> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.activity.value!.nbPlanified! <= 1,
      child: SingleEventActivity(),
      replacement: MultipleEventActivity(),
    );
  }
}
