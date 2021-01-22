import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanningCalendarGrid extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: controller.calendarController,
      events: controller.allEvents,
      startingDayOfWeek: StartingDayOfWeek.monday,
      locale: Get.locale.toLanguageTag(),
      initialCalendarFormat: CalendarFormat.week,
      calendarStyle: CalendarStyle(
        selectedColor: Color(primaryColor),
        todayColor: Color(greyColor),
        markersColor: Color(errorColor),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Color(primaryColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: controller.onDaySelected,
      onVisibleDaysChanged: controller.onVisibleDaysChanged,
      onCalendarCreated: controller.onCalendarCreated,
    );
  }
}
