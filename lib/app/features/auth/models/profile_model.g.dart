// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    json['id'] as String,
    json['profileName'] as String,
    json['deviceIdentifier'] as String,
    json['autologUrl'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) => <String, dynamic>{
      'id': instance.id,
      'profileName': instance.profileName,
      'deviceIdentifier': instance.deviceIdentifier,
      'autologUrl': instance.autologUrl,
    };
