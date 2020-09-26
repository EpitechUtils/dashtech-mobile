import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'module_model.g.dart';

@JsonSerializable(nullable: false)
class ModuleModel extends Equatable {
  String title;
  String title_link;
  int timeline_start;
  int timeline_end;
  int timeline_barre;
  int date_inscription;

  ModuleModel(
      this.title, this.title_link, this.timeline_start, this.timeline_end, this.timeline_barre, this.date_inscription);

  factory ModuleModel.fromJson(Map<dynamic, dynamic> json) => _$ModuleModelFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ModuleModelToJson(this);

  @override
  List<Object> get props => [title, title_link, timeline_start, timeline_end, timeline_barre, date_inscription];
}
