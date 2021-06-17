import 'package:dashtech/domain/card/models/card_profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_history.freezed.dart';
part 'card_history.g.dart';

@freezed
class CardHistory with _$CardHistory {
  const factory CardHistory({
    required DateTime createdAt,
    required String eventType,
    required String message,
    required CardProfile profile,
  }) = _CardHistory;

  factory CardHistory.fromJson(Map<String, dynamic> json) => _$CardHistoryFromJson(json);

  const CardHistory._();
}
