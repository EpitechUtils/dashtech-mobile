import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_course.freezed.dart';
part 'filter_course.g.dart';

@freezed
class FilterCourse with _$FilterCourse {
  const factory FilterCourse({
    required String code,
    required String old_title,
    required String shortcode_school,
    required String students,
    required String title,
  }) = _FilterCourse;

  factory FilterCourse.fromJson(Map<String, dynamic> json) => _$FilterCourseFromJson(json);

  const FilterCourse._();
}
