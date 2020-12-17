// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthProfileDto _$_$_AuthProfileDtoFromJson(Map<String, dynamic> json) {
  return _$_AuthProfileDto(
    expirationTime: json['expirationTime'] == null
        ? null
        : DateTime.parse(json['expirationTime'] as String),
    accessToken: json['accessToken'] as String,
  );
}

Map<String, dynamic> _$_$_AuthProfileDtoToJson(_$_AuthProfileDto instance) =>
    <String, dynamic>{
      'expirationTime': instance.expirationTime?.toIso8601String(),
      'accessToken': instance.accessToken,
    };
