import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable(nullable: false)
class ProfileModel extends Equatable {
  @JsonKey(nullable: true)
  final String id;
  final String profileName;
  final String deviceIdentifier;
  final String autologUrl;

  ProfileModel(this.id, this.profileName, this.deviceIdentifier, this.autologUrl);

  factory ProfileModel.fromJson(Map<dynamic, dynamic> json) => _$ProfileModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  List<Object> get props => [id, profileName, deviceIdentifier, autologUrl];
}
