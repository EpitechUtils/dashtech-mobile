import 'package:freezed_annotation/freezed_annotation.dart';

part 'planning_activity.freezed.dart';
part 'planning_activity.g.dart';

@freezed
class PlanningActivityRoom with _$PlanningActivityRoom {
  const factory PlanningActivityRoom({
    required String code,
    String? type,
    required int seats,
  }) = _PlanningActivityRoom;

  factory PlanningActivityRoom.fromJson(Map<String, dynamic> json) =>
      _$PlanningActivityRoomFromJson(json);

  const PlanningActivityRoom._();
}

@freezed
class PlanningActivity with _$PlanningActivity {
  const factory PlanningActivity({
    required String scolaryear,
    required String codemodule,
    required String codeinstance,
    required String codeacti,
    String? codeevent,
    String? semester,
    String? instance_location,
    String? title,
    required String titlemodule,
    required String acti_title,
    required String start,
    required String end,
    int? total_students_registered,
    String? nb_hours,
    bool? module_registered,
    bool? allow_register,
    required String event_registered,
    String? is_rdv,
    String? type_title,
    required String type_code,
    bool? past,
    required PlanningActivityRoom room,
  }) = _PlanningActivity;

  factory PlanningActivity.fromJson(Map<String, dynamic> json) =>
      _$PlanningActivityFromJson(json);

  const PlanningActivity._();
}
