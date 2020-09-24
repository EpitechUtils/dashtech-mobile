import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(nullable: false)
class ProfileModel extends Equatable {
  @JsonKey(nullable: true)
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String autologUrl;
  final String avatarUrl;

  ProfileModel(this.id, this.firstName, this.lastName, this.email, this.autologUrl, this.avatarUrl);

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) => _$ProfileModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  List<Object> get props => [id, firstName, lastName, email, autologUrl, avatarUrl];
}
