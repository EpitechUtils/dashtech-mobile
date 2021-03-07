import 'package:dashtech/domain/planning/models/activity_rdv_details.dart';
import 'package:dashtech/infrastructure/planning/dto/activity_details_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_rdv_details_dto.freezed.dart';
part 'activity_rdv_details_dto.g.dart';

@freezed
abstract class ActivityRdvGroupDto implements _$ActivityRdvGroupDto {
  const factory ActivityRdvGroupDto({
    int id,
    String code,
    String title,
    bool inscrit,
    String master,
    List<String> members,
  }) = _ActivityRdvGroupDto;

  factory ActivityRdvGroupDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvGroupDtoFromJson(json);

  const ActivityRdvGroupDto._();

  ActivityRdvGroup toDomain() {
    return ActivityRdvGroup(
      id: id,
      code: code,
      title: title,
      inscrit: inscrit,
      master: master,
      members: members,
    );
  }
}

@freezed
abstract class ActivityRdvProjectDto implements _$ActivityRdvProjectDto {
  const factory ActivityRdvProjectDto({
    String title,
    String codeacti,
    String id_projet,
  }) = _ActivityRdvProjectDto;

  factory ActivityRdvProjectDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvProjectDtoFromJson(json);

  const ActivityRdvProjectDto._();

  ActivityRdvProject toDomain() {
    return ActivityRdvProject(
      title: title,
      codeacti: codeacti,
      id_projet: id_projet,
    );
  }
}

@freezed
abstract class ActivityRdvEventDto implements _$ActivityRdvEventDto {
  const factory ActivityRdvEventDto({
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
  }) = _ActivityRdvEventDto;

  factory ActivityRdvEventDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvEventDtoFromJson(json);

  const ActivityRdvEventDto._();

  ActivityRdvEvent toDomain() {
    return ActivityRdvEvent(
      id: id,
      nb_registered: nb_registered,
      begin: begin,
      register: register,
      num_event: num_event,
      end: end,
      location: location,
      title: title,
      date_ins: date_ins,
      date_modif: date_modif,
    );
  }
}

@freezed
abstract class ActivityRdvMemberDto implements _$ActivityRdvMemberDto {
  const factory ActivityRdvMemberDto({
    String login,
    String title,
    String picture,
  }) = _ActivityRdvMemberDto;

  factory ActivityRdvMemberDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvMemberDtoFromJson(json);

  const ActivityRdvMemberDto._();

  ActivityRdvMember toDomain() {
    return ActivityRdvMember(
      login: login,
      title: title,
      picture: picture,
    );
  }
}

@freezed
abstract class ActivityRdvSlotDto implements _$ActivityRdvSlotDto {
  const factory ActivityRdvSlotDto({
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
    ActivityRdvMemberDto master,
    List<ActivityRdvMemberDto> members,
  }) = _ActivityRdvSlotDto;

  factory ActivityRdvSlotDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvSlotDtoFromJson(json);

  const ActivityRdvSlotDto._();

  ActivityRdvSlot toDomain() {
    return ActivityRdvSlot(
        id: id,
        note: note,
        acti_title: acti_title,
        date: date,
        duration: duration,
        status: status,
        bloc_status: bloc_status,
        id_team: id_team,
        id_user: id_user,
        date_ins: date_ins,
        code: code,
        title: title,
        module_title: module_title,
        members_picture: members_picture,
        past: past,
        master: master != null ? master.toDomain() : null,
        members: members != null
            ? members
                .map((ActivityRdvMemberDto member) => member.toDomain())
                .toList()
                .cast()
            : []);
  }
}

@freezed
abstract class ActivityRdvSlotBlocDto implements _$ActivityRdvSlotBlocDto {
  const factory ActivityRdvSlotBlocDto({
    int id,
    String title,
    String bloc_status,
    String room,
    String codeevent,
    List<ActivityRdvSlotDto> slots,
  }) = _ActivityRdvSlotBlocDto;

  factory ActivityRdvSlotBlocDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvSlotBlocDtoFromJson(json);

  const ActivityRdvSlotBlocDto._();

  ActivityRdvSlotBloc toDomain() {
    return ActivityRdvSlotBloc(
      id: id,
      title: title,
      bloc_status: bloc_status,
      room: room,
      codeevent: codeevent,
      slots: slots != null
          ? slots
              .map((ActivityRdvSlotDto slot) => slot.toDomain())
              .toList()
              .cast()
          : null,
    );
  }
}

@freezed
abstract class ActivityRdvDetailsDto implements _$ActivityRdvDetailsDto {
  const factory ActivityRdvDetailsDto({
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
    ActivityDetailsProjectDto project,
    ActivityRdvGroupDto group,
    List<ActivityRdvProjectDto> projects,
    List<ActivityRdvEventDto> events,
    List<ActivityRdvSlotBlocDto> slots,
  }) = _ActivityRdvDetailsDto;

  factory ActivityRdvDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityRdvDetailsDtoFromJson(json);

  const ActivityRdvDetailsDto._();

  ActivityRdvDetails toDomain() {
    return ActivityRdvDetails(
      scolaryear: scolaryear,
      codemodule: codemodule,
      codeinstance: codeinstance,
      codeacti: codeacti,
      instance_location: instance_location,
      module_title: module_title,
      student_registered: student_registered,
      title: title,
      description: description,
      register_by_bloc: register_by_bloc,
      with_project: with_project,
      nb_registered: nb_registered,
      nb_slots_full: nb_slots_full,
      project: project != null ? project.toDomain() : null,
      group: group != null ? group.toDomain() : null,
      projects: projects != null
          ? projects
              .map((ActivityRdvProjectDto project) => project.toDomain())
              .toList()
              .cast()
          : [],
      events: events != null
          ? events
              .map((ActivityRdvEventDto event) => event.toDomain())
              .toList()
              .cast()
          : [],
      slots: slots != null
          ? slots
              .map((ActivityRdvSlotBlocDto slotBloc) => slotBloc.toDomain())
              .toList()
              .cast()
          : [],
    );
  }
}
