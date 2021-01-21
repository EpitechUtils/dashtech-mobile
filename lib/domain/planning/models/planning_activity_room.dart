import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'planning_activity_room.freezed.dart';
part 'planning_activity_room.g.dart';

@freezed
abstract class PlanningActivityRoom implements _$PlanningActivityRoom {
  const factory PlanningActivityRoom({
    @required String code,
    String type,
    @required int seats,
  }) = _PlanningActivityRoom;

  factory PlanningActivityRoom.fromJson(Map<String, dynamic> json) =>
      _$PlanningActivityRoomFromJson(json);

  const PlanningActivityRoom._();
}
