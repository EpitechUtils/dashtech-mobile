import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:epitech_intranet_mobile/app/features/planning/utils/planning_activity.dart';
import 'package:epitech_intranet_mobile/app/shared/calendar/calendar.dart';
import 'package:epitech_intranet_mobile/app/shared/utils/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PlanningCalendarDataSource extends CalendarDataSource {
  PlanningCalendarDataSource(List<PlanningActivity> source) {
    appointments = source;
  }

  static parseFromModel(List<PlanningActivityModel> activitiesModel) {
    return activitiesModel.map((activity) {
      DateTime startTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(activity.start);
      DateTime endTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(activity.end);

      // Parse room
      String room = "n/a";
      try {
        room = activity.room.code.split('/').last +
            " (" +
            activity.total_students_registered.toString() +
            "/" +
            activity.room.seats.toString() +
            ")";
      } catch (ignored) {}

      // Create planning activity
      return PlanningActivity(
          activity.titlemodule + " - " + activity.acti_title,
          room,
          startTime,
          endTime,
          activity.event_registered == "registered"
              ? ActivityColorUtils.getColorByEventType(activity.type_code)
              : ActivityColorUtils.getColorByEventType(activity.type_code, opacity: 0.6),
          false,
          activity);
    }).toList();
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].from;
  }

  @override
  String getLocation(int index) {
    return appointments[index].notes;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].to;
  }

  @override
  String getSubject(int index) {
    return appointments[index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments[index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments[index].isAllDay;
  }
}
