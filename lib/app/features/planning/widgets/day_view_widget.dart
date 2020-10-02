import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:epitech_intranet_mobile/app/features/planning/utils/planning_activity.dart';
import 'package:epitech_intranet_mobile/app/features/planning/utils/planning_calendar_data_source.dart';
import 'package:epitech_intranet_mobile/app/shared/calendar/calendar.dart';
import 'package:flutter/material.dart';

class DayViewWidget extends StatelessWidget {
  final List<PlanningActivityModel> activities;

  DayViewWidget(this.activities);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      initialSelectedDate: DateTime.now(),
      //onViewChanged: this.onViewChanged,
      view: CalendarView.day,
      dataSource: PlanningCalendarDataSource(PlanningCalendarDataSource.parseFromModel(activities)),
      onTap: (CalendarTapDetails details) {
        List<dynamic> appointmentsList = details.appointments;
        if (appointmentsList == null) return;

        // Get meeting 0
        PlanningActivity meeting = appointmentsList[0];
        if (meeting == null) return;

        print(meeting.eventName);
      },
      todayHighlightColor: Theme.of(context).primaryColor,
      headerStyle: CalendarHeaderStyle(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      viewHeaderStyle: ViewHeaderStyle(backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      timeSlotViewSettings: TimeSlotViewSettings(startHour: 7, timeFormat: "Hm"),
    );
  }
}
