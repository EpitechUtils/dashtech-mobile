import 'package:epitech_intranet_mobile/app/features/notification/models/notification_user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(nullable: false)
class NotificationModel extends Equatable {
  String title;
  NotificationUserModel user;
  String content;
  String date;
  String id;
  String visible;
  String id_activite;
  @JsonKey(name: "class")
  String className;

  NotificationModel(
      this.title, this.user, this.content, this.date, this.id, this.visible, this.id_activite, this.className);

  factory NotificationModel.fromJson(Map<dynamic, dynamic> json) => _$NotificationModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$NotificationModelToJson(this);

  @override
  List<Object> get props => [title, user, content, date, id, visible, id_activite, className];
}
