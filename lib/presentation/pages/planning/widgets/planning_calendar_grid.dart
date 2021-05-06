import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanningCalendarGrid extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    /*return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: GetBuilder<PlanningController>(
        builder: (_) => TableCalendar(
          calendarController: controller.calendarController,
          events: controller.allEvents,
          startingDayOfWeek: StartingDayOfWeek.monday,
          locale: Get.locale.toLanguageTag(),
          initialCalendarFormat: CalendarFormat.week,
          availableCalendarFormats: {CalendarFormat.week: 'Semaine'},
          calendarStyle: CalendarStyle(
            selectedColor: Color(primaryColor),
            todayColor: Color(greyColor),
            markersColor: Color(errorColor),
            outsideDaysVisible: false,
          ),
          headerStyle: HeaderStyle(
            formatButtonTextStyle: TextStyle().copyWith(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
          onDaySelected: controller.onDaySelected,
          onVisibleDaysChanged: controller.onVisibleDaysChanged,
          onCalendarCreated: controller.onCalendarCreated,
        ),
      ),
    );*/
    return Container();
  }
}
