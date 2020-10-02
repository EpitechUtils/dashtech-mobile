import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_room_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'planning_activity_model.g.dart';

@JsonSerializable(nullable: false)
class PlanningActivityModel extends Equatable {
  String scolaryear;
  String codemodule;
  String codeinstance;
  String codeacti;
  String codeevent;
  String semester;
  String instance_location;
  @JsonKey(nullable: true)
  String title;
  @JsonKey(nullable: true)
  String titlemodule;
  String acti_title;
  String start;
  String end;
  int total_students_registered;
  String nb_hours;
  @JsonKey(nullable: true)
  bool module_registered;
  @JsonKey(nullable: true)
  bool allow_register;
  String event_registered;
  String is_rdv;
  String type_title;
  String type_code;
  @JsonKey(nullable: true)
  bool past;
  @JsonKey(nullable: true)
  PlanningActivityRoomModel room;

  PlanningActivityModel(
      this.scolaryear,
      this.codemodule,
      this.codeinstance,
      this.codeacti,
      this.codeevent,
      this.semester,
      this.instance_location,
      this.title,
      this.titlemodule,
      this.acti_title,
      this.start,
      this.end,
      this.total_students_registered,
      this.nb_hours,
      this.module_registered,
      this.allow_register,
      this.event_registered,
      this.is_rdv,
      this.type_title,
      this.type_code,
      this.past,
      this.room);

  factory PlanningActivityModel.fromJson(Map<dynamic, dynamic> json) => _$PlanningActivityModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$PlanningActivityModelToJson(this);

  @override
  List<Object> get props => [
        scolaryear,
        codemodule,
        codeinstance,
        codeacti,
        codeevent,
        semester,
        instance_location,
        title,
        titlemodule,
        acti_title,
        start,
        end,
        total_students_registered,
        nb_hours,
        module_registered,
        allow_register,
        event_registered,
        is_rdv,
        type_title,
        type_code,
        past,
        room
      ];
}
