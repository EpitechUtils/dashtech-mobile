import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_details.freezed.dart';
part 'activity_details.g.dart';

@freezed
class ActivityDetailsEventAssistant with _$ActivityDetailsEventAssistant {
  const factory ActivityDetailsEventAssistant({
    required String login,
    required String title,
    required String picture,
    required String manager_status,
  }) = _ActivityDetailsEventAssistant;

  factory ActivityDetailsEventAssistant.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsEventAssistantFromJson(json);

  const ActivityDetailsEventAssistant._();
}

@freezed
class ActivityDetailsEvent with _$ActivityDetailsEvent {
  const factory ActivityDetailsEvent({
    required String code,
    required String num_event,
    required String seats,
    String? title,
    String? description,
    required String nb_inscrits,
    required String begin,
    required String end,
    String? id_activite,
    required String location,
    String? nb_max_students_projet,
    String? already_register,
    String? user_status,
    String? allow_token,
    required List<ActivityDetailsEventAssistant> assistants,
  }) = _ActivityDetailsEvent;

  factory ActivityDetailsEvent.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsEventFromJson(json);

  const ActivityDetailsEvent._();
}

@freezed
class ActivityDetailsProject with _$ActivityDetailsProject {
  const factory ActivityDetailsProject({
    int? id,
    String? scolaryear,
    String? codemodule,
    String? codeinstance,
    String? title,
  }) = _ActivityDetailsProject;

  factory ActivityDetailsProject.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsProjectFromJson(json);

  const ActivityDetailsProject._();
}

@freezed
class ActivityDetails with _$ActivityDetails {
  const factory ActivityDetails({
    required String scolaryear,
    required String codemodule,
    required String codeinstance,
    required String codeacti,
    String? call_ihk,
    String? slug,
    String? instance_location,
    String? module_title,
    required String title,
    required String description,
    required String type_title,
    required String type_code,
    required String begin,
    String? start,
    String? end_register,
    String? deadline,
    String? end,
    String? nb_hours,
    int? nb_group,
    int? num,
    String? register,
    String? register_by_bloc,
    String? register_prof,
    String? title_location_type,
    bool? is_projet,
    String? id_projet,
    String? project_title,
    bool? is_note,
    String? nb_notes,
    bool? is_blocins,
    String? rdv_status,
    String? id_bareme,
    String? title_bareme,
    String? archive,
    String? hash_elearning,
    String? ged_node_adm,
    required int nb_planified,
    bool? hidden,
    ActivityDetailsProject? project,
    required List<ActivityDetailsEvent> events,
  }) = _ActivityDetails;

  factory ActivityDetails.fromJson(Map<String, dynamic> json) => _$ActivityDetailsFromJson(json);

  const ActivityDetails._();
}
