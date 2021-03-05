import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:dashtech/presentation/pages/planning/widgets/planning_activity_card.dart';
import 'package:dashtech/presentation/pages/planning/widgets/planning_empty_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanningDayEventsList extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanningController>(
      builder: (_) => Visibility(
        visible: controller.selectedDateEvents.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            itemCount: controller.selectedDateEvents.length + 1,
            itemBuilder: (BuildContext c, int index) {
              if (index == controller.selectedDateEvents.length) {
                return SizedBox(height: 120);
              }

              return PlanningActivityCard(
                activity: controller.selectedDateEvents[index],
                index: index,
              );
            },
          ),
        ),
        replacement: PlanningEmptyEvents(),
      ),
    );
  }
}
