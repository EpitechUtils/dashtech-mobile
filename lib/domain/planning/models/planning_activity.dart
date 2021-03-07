import 'package:dashtech/domain/planning/models/planning_activity_room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'planning_activity.freezed.dart';
part 'planning_activity.g.dart';

@freezed
abstract class PlanningActivity implements _$PlanningActivity {
  const factory PlanningActivity({
    String scolaryear,
    String codemodule,
    String codeinstance,
    String codeacti,
    String codeevent,
    String semester,
    String instance_location,
    String title,
    String titlemodule,
    String acti_title,
    String start,
    String end,
    int total_students_registered,
    String nb_hours,
    bool module_registered,
    bool allow_register,
    String event_registered,
    String is_rdv,
    String type_title,
    String type_code,
    bool past,
    PlanningActivityRoom room,
  }) = _PlanningActivity;

  factory PlanningActivity.fromJson(Map<String, dynamic> json) =>
      _$PlanningActivityFromJson(json);

  const PlanningActivity._();
}
