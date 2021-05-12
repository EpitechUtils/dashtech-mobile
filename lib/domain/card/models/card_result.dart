import 'package:dashtech/domain/card/models/card.dart';
import 'package:dashtech/domain/card/models/card_history.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_result.freezed.dart';
part 'card_result.g.dart';

@freezed
class CardResult with _$CardResult {
  const factory CardResult({
    Card? card,
    List<CardHistory>? history,
  }) = _CardResult;

  factory CardResult.fromJson(Map<String, dynamic> json) =>
      _$CardResultFromJson(json);

  const CardResult._();
}
