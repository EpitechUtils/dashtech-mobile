import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_user_model.g.dart';

@JsonSerializable(nullable: false)
class NotificationUserModel extends Equatable {
  String picture;
  String title;
  String url;

  NotificationUserModel(this.picture, this.title, this.url);

  factory NotificationUserModel.fromJson(Map<dynamic, dynamic> json) => _$NotificationUserModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$NotificationUserModelToJson(this);

  @override
  List<Object> get props => [picture, title, url];
}
