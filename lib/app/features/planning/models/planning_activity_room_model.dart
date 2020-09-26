import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'planning_activity_room_model.g.dart';

@JsonSerializable(nullable: false)
class PlanningActivityRoomModel extends Equatable {
  String code;
  String type;
  int seats;

  PlanningActivityRoomModel(this.code, this.type, this.seats);

  factory PlanningActivityRoomModel.fromJson(Map<dynamic, dynamic> json) => _$PlanningActivityRoomModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$PlanningActivityRoomModelToJson(this);

  @override
  List<Object> get props => [code, type, seats];
}
