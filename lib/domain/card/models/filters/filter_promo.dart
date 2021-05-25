import 'package:dashtech/domain/card/models/card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_promo.freezed.dart';
part 'filter_promo.g.dart';

@freezed
class FilterPromo with _$FilterPromo {
  const factory FilterPromo({
    required String promo,
    required String promo_deprecated,
    required String students,
  }) = _FilterPromo;

  factory FilterPromo.fromJson(Map<String, dynamic> json) =>
      _$FilterPromoFromJson(json);

  const FilterPromo._();
}
