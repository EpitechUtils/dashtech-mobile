import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_rdv_details.freezed.dart';
part 'activity_rdv_details.g.dart';

@freezed
abstract class ActivityRdvGroup implements _$ActivityRdvGroup {
  const factory ActivityRdvGroup({
    int id,
    String code,
    String title,
    bool inscrit,
    String master,
    List<String> members,
  }) = _ActivityRdvGroup;

  factory ActivityRdvGroup.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvGroupFromJson(json);

  const ActivityRdvGroup._();
}

@freezed
abstract class ActivityRdvProject implements _$ActivityRdvProject {
  const factory ActivityRdvProject({
    String title,
    String codeacti,
    String id_projet,
  }) = _ActivityRdvProject;

  factory ActivityRdvProject.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvProjectFromJson(json);

  const ActivityRdvProject._();
}

@freezed
abstract class ActivityRdvEvent implements _$ActivityRdvEvent {
  const factory ActivityRdvEvent({
    String id,
    String nb_registered,
    String begin,
    String register,
    String num_event,
    String end,
    String location,
    String title,
    String date_ins,
    String date_modif,
  }) = _ActivityRdvEvent;

  factory ActivityRdvEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvEventFromJson(json);

  const ActivityRdvEvent._();
}

@freezed
abstract class ActivityRdvMember implements _$ActivityRdvMember {
  const factory ActivityRdvMember({
    String login,
    String title,
    String picture,
  }) = _ActivityRdvMember;

  factory ActivityRdvMember.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvMemberFromJson(json);

  const ActivityRdvMember._();
}

@freezed
abstract class ActivityRdvSlot implements _$ActivityRdvSlot {
  const factory ActivityRdvSlot({
    int id,
    String note,
    String acti_title,
    String date,
    int duration,
    String status,
    String bloc_status,
    String id_team,
    String id_user,
    String date_ins,
    String code,
    String title,
    String module_title,
    String members_picture,
    int past,
    ActivityRdvMember master,
    List<ActivityRdvMember> members,
  }) = _ActivityRdvSlot;

  factory ActivityRdvSlot.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvSlotFromJson(json);

  const ActivityRdvSlot._();
}

@freezed
abstract class ActivityRdvSlotBloc implements _$ActivityRdvSlotBloc {
  const factory ActivityRdvSlotBloc({
    int id,
    String title,
    String bloc_status,
    String room,
    String codeevent,
    List<ActivityRdvSlot> slots,
  }) = _ActivityRdvSlotBloc;

  factory ActivityRdvSlotBloc.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvSlotBlocFromJson(json);

  const ActivityRdvSlotBloc._();
}

@freezed
abstract class ActivityRdvDetails implements _$ActivityRdvDetails {
  const factory ActivityRdvDetails({
    String scolaryear,
    String codemodule,
    String codeinstance,
    String codeacti,
    bool register_by_bloc,
    String title,
    String description,
    String instance_location,
    String module_title,
    String student_registered,
    bool with_project,
    int nb_registered,
    int nb_slots_full,
    ActivityDetailsProject project,
    ActivityRdvGroup group,
    List<ActivityRdvProject> projects,
    List<ActivityRdvEvent> events,
    List<ActivityRdvSlotBloc> slots,
  }) = _ActivityRdvDetails;

  factory ActivityRdvDetails.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvDetailsFromJson(json);

  const ActivityRdvDetails._();
}
