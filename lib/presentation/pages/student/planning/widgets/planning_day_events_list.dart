import 'package:dashtech/application/student/planning/planning_controller.dart';
import 'package:dashtech/domain/planning/datasource/activity_datasource.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PlanningDayEventsList extends GetView<PlanningController> {
  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();

    return GetBuilder<PlanningController>(
      id: 'planning_display',
      builder: (PlanningController controller) {
        return SfCalendar(
          view: CalendarView.week,
          controller: controller.calendarController,
          dataSource: ActivityDataSource(controller.allEvents),
          initialDisplayDate: date.subtract(Duration(days: date.weekday - 1)),
          initialSelectedDate: date,
          allowedViews: [CalendarView.day, CalendarView.week],
          firstDayOfWeek: 1,
          allowViewNavigation: true,
          onTap: controller.onActivityTap,
          onViewChanged: controller.onViewChanged,
        );
      },
    );
  }
}
