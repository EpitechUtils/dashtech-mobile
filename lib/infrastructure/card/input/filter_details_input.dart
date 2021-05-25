import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_details_input.freezed.dart';

@freezed
class FilterDetailsInput with _$FilterDetailsInput {
  const factory FilterDetailsInput({
    required String filter,
    String? scolaryear,
    String? course,
  }) = _FilterDetailsInput;
}
