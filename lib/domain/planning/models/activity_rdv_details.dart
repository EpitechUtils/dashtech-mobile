import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_rdv_details.freezed.dart';
part 'activity_rdv_details.g.dart';

@freezed
class ActivityRdvGroup with _$ActivityRdvGroup {
  const factory ActivityRdvGroup({
    required int id,
    required String code,
    required String title,
    required bool inscrit,
    required String master,
    required List<String> members,
  }) = _ActivityRdvGroup;

  factory ActivityRdvGroup.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvGroupFromJson(json);

  const ActivityRdvGroup._();
}

@freezed
class ActivityRdvProject with _$ActivityRdvProject {
  const factory ActivityRdvProject({
    String? title,
    String? codeacti,
    String? id_projet,
  }) = _ActivityRdvProject;

  factory ActivityRdvProject.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvProjectFromJson(json);

  const ActivityRdvProject._();
}

@freezed
class ActivityRdvEvent with _$ActivityRdvEvent {
  const factory ActivityRdvEvent({
    String? id,
    String? nb_registered,
    String? begin,
    String? register,
    String? num_event,
    String? end,
    String? location,
    String? title,
    String? date_ins,
    String? date_modif,
  }) = _ActivityRdvEvent;

  factory ActivityRdvEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvEventFromJson(json);

  const ActivityRdvEvent._();
}

@freezed
class ActivityRdvMember with _$ActivityRdvMember {
  const factory ActivityRdvMember({
    required String login,
    required String title,
    required String picture,
  }) = _ActivityRdvMember;

  factory ActivityRdvMember.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvMemberFromJson(json);

  const ActivityRdvMember._();
}

@freezed
class ActivityRdvSlot with _$ActivityRdvSlot {
  const factory ActivityRdvSlot({
    int? id,
    String? note,
    required String acti_title,
    required String date,
    required int duration,
    String? status,
    String? bloc_status,
    String? id_team,
    String? id_user,
    String? date_ins,
    String? code,
    String? title,
    String? module_title,
    String? members_picture,
    int? past,
    required ActivityRdvMember? master,
    @Default([]) List<ActivityRdvMember> members,
  }) = _ActivityRdvSlot;

  factory ActivityRdvSlot.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvSlotFromJson(json);

  const ActivityRdvSlot._();
}

@freezed
class ActivityRdvSlotBloc with _$ActivityRdvSlotBloc {
  const factory ActivityRdvSlotBloc({
    required int id,
    required String title,
    required String bloc_status,
    required String room,
    required String codeevent,
    required List<ActivityRdvSlot> slots,
  }) = _ActivityRdvSlotBloc;

  factory ActivityRdvSlotBloc.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvSlotBlocFromJson(json);

  const ActivityRdvSlotBloc._();
}

@freezed
class ActivityRdvDetails with _$ActivityRdvDetails {
  const factory ActivityRdvDetails({
    String? scolaryear,
    String? codemodule,
    String? codeinstance,
    String? codeacti,
    bool? register_by_bloc,
    String? title,
    String? description,
    String? instance_location,
    String? module_title,
    String? student_registered,
    bool? with_project,
    int? nb_registered,
    int? nb_slots_full,
    ActivityDetailsProject? project,
    required ActivityRdvGroup? group,
    List<ActivityRdvProject>? projects,
    required List<ActivityRdvEvent> events,
    required List<ActivityRdvSlotBloc> slots,
  }) = _ActivityRdvDetails;

  factory ActivityRdvDetails.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvDetailsFromJson(json);

  const ActivityRdvDetails._();
}
