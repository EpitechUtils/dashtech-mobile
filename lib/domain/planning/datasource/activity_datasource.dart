import 'dart:ui';

import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ActivityDataSource extends CalendarDataSource {
  ActivityDataSource(
    Map<DateTime, List<PlanningWeekActivities$Query$PlanningWeekActivity$PlanningActivity>> source,
  ) {
    appointments = [];
    source.forEach((key, value) => appointments!.addAll(value));
  }

  @override
  DateTime getStartTime(int index) {
    return DateTime.parse(appointments![index].start!);
  }

  @override
  DateTime getEndTime(int index) {
    return DateTime.parse(appointments![index].end!);
  }

  @override
  String getSubject(int index) {
    return appointments![index].actiTitle!;
  }

  @override
  Color getColor(int index) {
    return ActivityColorUtils.getColorByEventType(appointments![index].typeCode!).withOpacity(
      appointments![index].eventRegistered != "false" ? 1 : 0.6,
    );
  }

  @override
  bool isAllDay(int index) => false;
}
