import 'dart:ui';

import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ActivityDataSource extends CalendarDataSource {
  ActivityDataSource(List<PlanningActivity> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].start;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].end;
  }

  @override
  String getSubject(int index) {
    return appointments![index].acti_title;
  }

  @override
  Color getColor(int index) {
    return ActivityColorUtils.getColorByEventType(
        appointments![index].type_code);
  }

  @override
  bool isAllDay(int index) => false;
}
