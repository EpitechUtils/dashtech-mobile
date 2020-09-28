import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'setting_model.g.dart';

@JsonSerializable(nullable: false)
class SettingModel extends Equatable {
  String id;
  String setting;
  String value;

  SettingModel(this.id, this.setting, this.value);

  factory SettingModel.fromJson(Map<dynamic, dynamic> json) => _$SettingModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$SettingModelToJson(this);

  @override
  List<Object> get props => [id, setting, value];
}
