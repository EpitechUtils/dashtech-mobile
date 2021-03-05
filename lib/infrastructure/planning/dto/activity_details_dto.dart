import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_details_dto.freezed.dart';
part 'activity_details_dto.g.dart';

@freezed
abstract class ActivityDetailsEventAssistantDto
    implements _$ActivityDetailsEventAssistantDto {
  const factory ActivityDetailsEventAssistantDto({
    String login,
    String title,
    String picture,
    String manager_status,
  }) = _ActivityDetailsEventAssistantDto;

  factory ActivityDetailsEventAssistantDto.fromJson(
          Map<String, dynamic> json) =>
      _$ActivityDetailsEventAssistantDtoFromJson(json);

  const ActivityDetailsEventAssistantDto._();

  ActivityDetailsEventAssistant toDomain() {
    return ActivityDetailsEventAssistant(
      login: login,
      title: title,
      picture: picture,
      manager_status: manager_status,
    );
  }
}

@freezed
abstract class ActivityDetailsProjectDto
    implements _$ActivityDetailsProjectDto {
  const factory ActivityDetailsProjectDto({
    int id,
    String scolaryear,
    String codemodule,
    String codeinstance,
    String title,
  }) = _ActivityDetailsProjectDto;

  factory ActivityDetailsProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsProjectDtoFromJson(json);

  const ActivityDetailsProjectDto._();

  ActivityDetailsProject toDomain() {
    return ActivityDetailsProject(
      id: id,
      scolaryear: scolaryear,
      codemodule: codemodule,
      codeinstance: codeinstance,
      title: title,
    );
  }
}

@freezed
abstract class ActivityDetailsEventDto implements _$ActivityDetailsEventDto {
  const factory ActivityDetailsEventDto({
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
    List<ActivityDetailsEventAssistantDto> assistants,
  }) = _ActivityDetailsEventDto;

  factory ActivityDetailsEventDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsEventDtoFromJson(json);

  const ActivityDetailsEventDto._();

  ActivityDetailsEvent toDomain() {
    return ActivityDetailsEvent(
      code: code,
      num_event: num_event,
      seats: seats,
      title: title,
      description: description,
      nb_inscrits: nb_inscrits,
      begin: begin,
      end: end,
      id_activite: id_activite,
      location: location,
      nb_max_students_projet: nb_max_students_projet,
      already_register: already_register,
      user_status: user_status,
      allow_token: allow_token,
      assistants: assistants != null
          ? assistants
              .map((ActivityDetailsEventAssistantDto event) => event.toDomain())
              .toList()
              .cast()
          : null,
    );
  }
}

@freezed
abstract class ActivityDetailsDto implements _$ActivityDetailsDto {
  const factory ActivityDetailsDto({
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
    ActivityDetailsProjectDto project,
    List<ActivityDetailsEventDto> events,
  }) = _ActivityDetailsDto;

  factory ActivityDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityDetailsDtoFromJson(json);

  const ActivityDetailsDto._();

  ActivityDetails toDomain() {
    return ActivityDetails(
      scolaryear: scolaryear,
      codemodule: codemodule,
      codeinstance: codeinstance,
      codeacti: codeacti,
      call_ihk: call_ihk,
      slug: slug,
      instance_location: instance_location,
      module_title: module_title,
      title: title,
      description: description,
      type_title: type_title,
      type_code: type_code,
      begin: begin,
      start: start,
      end_register: end_register,
      deadline: deadline,
      end: end,
      nb_hours: nb_hours,
      nb_group: nb_group,
      num: this.num,
      register: register,
      register_by_bloc: register_by_bloc,
      register_prof: register_prof,
      title_location_type: title_location_type,
      is_projet: is_projet,
      id_projet: id_projet,
      project_title: project_title,
      is_note: is_note,
      nb_notes: nb_notes,
      is_blocins: is_blocins,
      rdv_status: rdv_status,
      id_bareme: id_bareme,
      title_bareme: title_bareme,
      archive: archive,
      hash_elearning: hash_elearning,
      ged_node_adm: ged_node_adm,
      nb_planified: nb_planified,
      hidden: hidden,
      project: project != null ? project.toDomain() : null,
      events: events != null
          ? events
              .map((ActivityDetailsEventDto event) => event.toDomain())
              .toList()
              .cast()
          : [],
    );
  }
}
