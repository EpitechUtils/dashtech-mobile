import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:epitech_intranet_mobile/app/features/planning/utils/planning_activity.dart';
import 'package:epitech_intranet_mobile/app/features/planning/utils/planning_calendar_data_source.dart';
import 'package:epitech_intranet_mobile/app/shared/calendar/calendar.dart';
import 'package:flutter/material.dart';

class MonthViewWidget extends StatelessWidget {
  final List<PlanningActivityModel> activities;

  MonthViewWidget(this.activities);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      initialSelectedDate: DateTime.now(),
      //onViewChanged: this.onViewChanged,
      view: CalendarView.month,
      dataSource: PlanningCalendarDataSource(PlanningCalendarDataSource.parseFromModel(activities)),
      onTap: (CalendarTapDetails details) {
        List<dynamic> appointmentsList = details.appointments;
        if (appointmentsList == null) return;

        // Get meeting 0
        PlanningActivity meeting = appointmentsList[0];
        if (meeting == null) return;

        print(meeting.eventName);
      },
      viewHeaderHeight: 0,
      headerHeight: 0,
      todayHighlightColor: Color(0xFF0072ff),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      timeSlotViewSettings: TimeSlotViewSettings(startHour: 7, timeFormat: "Hm"),
      monthViewSettings: MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
    );
  }
}
