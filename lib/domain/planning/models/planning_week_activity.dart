import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planning_week_activity.freezed.dart';
part 'planning_week_activity.g.dart';

@freezed
class PlanningWeekActivity with _$PlanningWeekActivity {
  const factory PlanningWeekActivity({
    required String date,
    required List<PlanningActivity> activities,
  }) = _PlanningWeekActivity;

  factory PlanningWeekActivity.fromJson(Map<String, dynamic> json) =>
      _$PlanningWeekActivityFromJson(json);

  const PlanningWeekActivity._();
}
