// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthProfileModel _$AuthProfileModelFromJson(Map<String, dynamic> json) {
  return AuthProfileModel(
    csrf: json['csrf'] as String,
    profile: ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
    jwtToken: json['jwtToken'] as String,
  );
}

Map<String, dynamic> _$AuthProfileModelToJson(AuthProfileModel instance) => <String, dynamic>{
      'csrf': instance.csrf,
      'profile': instance.profile,
      'jwtToken': instance.jwtToken,
    };
