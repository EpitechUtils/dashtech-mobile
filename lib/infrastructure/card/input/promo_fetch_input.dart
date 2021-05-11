import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_fetch_input.freezed.dart';

@freezed
class PromoFetchInput with _$PromoFetchInput {
  const factory PromoFetchInput({
    String? year,
    required String course,
    required String promo,
  }) = _PromoFetchInput;
}
