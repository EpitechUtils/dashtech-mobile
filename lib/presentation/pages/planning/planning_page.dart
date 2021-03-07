import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:dashtech/presentation/pages/planning/widgets/planning_app_bar.dart';
import 'package:dashtech/presentation/pages/planning/widgets/planning_day_events_list.dart';
import 'package:dashtech/presentation/pages/planning/widgets/planning_day_events_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanningPage extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlanningAppBar(),
      body: Obx(
        () => Visibility(
          visible: !controller.showShimmer.value,
          child: PlanningDayEventsList(),
          replacement: PlanningDayEventsListShimmer(),
        ),
      ),
    );
  }
}
