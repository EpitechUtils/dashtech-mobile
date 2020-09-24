// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return ProfileModel(
    json['id'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['email'] as String,
    json['autologUrl'] as String,
    json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'autologUrl': instance.autologUrl,
      'avatarUrl': instance.avatarUrl,
    };
