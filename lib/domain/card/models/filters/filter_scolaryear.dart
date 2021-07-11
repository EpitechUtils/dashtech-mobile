import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_scolaryear.freezed.dart';
part 'filter_scolaryear.g.dart';

@freezed
class FilterScolaryear with _$FilterScolaryear {
  const factory FilterScolaryear({
    required String students,
    required String scolaryear,
  }) = _FilterScolaryear;

  factory FilterScolaryear.fromJson(Map<String, dynamic> json) => _$FilterScolaryearFromJson(json);

  const FilterScolaryear._();
}
