import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:epitech_intranet_mobile/app/features/profile/models/profile_model.dart';

part 'auth_profile_model.g.dart';

@JsonSerializable(nullable: false)
class AuthProfileModel extends Equatable {
  final String csrf;
  final ProfileModel profile;
  final String jwtToken;

  AuthProfileModel({this.csrf, this.profile, this.jwtToken});

  factory AuthProfileModel.fromJson(Map<String, dynamic> json) => _$AuthProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthProfileModelToJson(this);

  @override
  List<Object> get props => [csrf, profile, jwtToken];
}
