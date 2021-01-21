import 'package:dashtech/domain/planning/models/planning_activity_room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'planning_activity.freezed.dart';
part 'planning_activity.g.dart';

@freezed
abstract class PlanningActivity implements _$PlanningActivity {
  const factory PlanningActivity({
    @required String scolaryear,
    @required String codemodule,
    @required String codeinstance,
    @required String codeacti,
    @required String codeevent,
    @required String semester,
    @required String instance_location,
    String title,
    String titlemodule,
    @required String acti_title,
    @required String start,
    @required String end,
    @required int total_students_registered,
    @required String nb_hours,
    bool module_registered,
    bool allow_register,
    @required String event_registered,
    @required String is_rdv,
    @required String type_title,
    @required String type_code,
    bool past,
    PlanningActivityRoom room,
  }) = _PlanningActivity;

  factory PlanningActivity.fromJson(Map<String, dynamic> json) =>
      _$PlanningActivityFromJson(json);

  const PlanningActivity._();
}
