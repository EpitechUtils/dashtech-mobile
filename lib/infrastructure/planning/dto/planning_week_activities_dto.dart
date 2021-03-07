import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'planning_week_activities_dto.freezed.dart';
part 'planning_week_activities_dto.g.dart';

@freezed
abstract class PlanningWeekActivitiesDto
    implements _$PlanningWeekActivitiesDto {
  const factory PlanningWeekActivitiesDto({
    @required String date,
    @required List<PlanningActivity> activities,
  }) = _PlanningWeekActivitiesDto;

  factory PlanningWeekActivitiesDto.fromJson(Map<String, dynamic> json) =>
      _$PlanningWeekActivitiesDtoFromJson(json);

  const PlanningWeekActivitiesDto._();

  PlanningWeekActivity toDomain() {
    return PlanningWeekActivity(
      date: date,
      activities: activities,
    );
  }
}
