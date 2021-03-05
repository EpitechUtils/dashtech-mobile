import 'package:dashtech/domain/planning/models/planning_activity_room.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'activity_details.freezed.dart';
part 'activity_details.g.dart';

@freezed
abstract class ActivityDetailsEvent implements _$ActivityDetailsEvent {
  const factory ActivityDetailsEvent({
    String code,
    String num_event,
    String seats,
    String title,
    String description,
    String nb_inscrits,
    String begin,
    String end,
    String id_activite,
    String location,
    String nb_max_students_projet,
    String already_register,
    String user_status,
    String allow_token,
  }) = _ActivityDetailsEvent;

  factory ActivityDetailsEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsEventFromJson(json);

  const ActivityDetailsEvent._();
}

@freezed
abstract class ActivityDetailsProject implements _$ActivityDetailsProject {
  const factory ActivityDetailsProject({
    int id,
    String scolaryear,
    String codemodule,
    String codeinstance,
    String title,
  }) = _ActivityDetailsProject;

  factory ActivityDetailsProject.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsProjectFromJson(json);

  const ActivityDetailsProject._();
}

@freezed
abstract class ActivityDetails implements _$ActivityDetails {
  const factory ActivityDetails({
    String scolaryear,
    String codemodule,
    String codeinstance,
    String codeacti,
    String call_ihk,
    String slug,
    String instance_location,
    String module_title,
    String title,
    String description,
    String type_title,
    String type_code,
    String begin,
    String start,
    String end_register,
    String deadline,
    String end,
    String nb_hours,
    int nb_group,
    int num,
    String register,
    String register_by_bloc,
    String register_prof,
    String title_location_type,
    bool is_projet,
    String id_projet,
    String project_title,
    bool is_note,
    String nb_notes,
    bool is_blocins,
    String rdv_status,
    String id_bareme,
    String title_bareme,
    String archive,
    String hash_elearning,
    String ged_node_adm,
    int nb_planified,
    bool hidden,
    ActivityDetailsProject project,
    List<ActivityDetailsEvent> events,
  }) = _ActivityDetails;

  factory ActivityDetails.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsFromJson(json);

  const ActivityDetails._();
}
