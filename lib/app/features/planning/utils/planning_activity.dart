import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:flutter/material.dart';

class PlanningActivity {
  PlanningActivity(this.eventName, this.notes, this.from, this.to, this.background, this.isAllDay, this.event);

  String eventName;
  String notes;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  PlanningActivityModel event;
}
