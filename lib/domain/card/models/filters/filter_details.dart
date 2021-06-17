import 'package:dashtech/domain/card/models/card.dart';
import 'package:dashtech/domain/card/models/filters/filter_course.dart';
import 'package:dashtech/domain/card/models/filters/filter_promo.dart';
import 'package:dashtech/domain/card/models/filters/filter_scolaryear.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_details.freezed.dart';
part 'filter_details.g.dart';

@freezed
class FilterDetails with _$FilterDetails {
  const factory FilterDetails({
    required String filterType,
    List<FilterScolaryear>? years,
    List<FilterCourse>? courses,
    List<FilterPromo>? promos,
  }) = _FilterDetails;

  factory FilterDetails.fromJson(Map<String, dynamic> json) => _$FilterDetailsFromJson(json);

  const FilterDetails._();
}
