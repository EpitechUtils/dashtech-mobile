import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:dashtech/presentation/pages/planning/widgets/planning_activity_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanningDayEventsList extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: controller.selectedDateEvents.length + 1,
        itemBuilder: (BuildContext c, int index) {
          if (index == controller.selectedDateEvents.length) {
            return SizedBox(height: 30);
          }

          return PlanningActivityCard(
            activity: controller.selectedDateEvents[index],
            index: index,
          );
        },
      ),
    );
  }
}
