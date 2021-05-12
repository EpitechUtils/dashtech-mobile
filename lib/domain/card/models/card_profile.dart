import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_profile.freezed.dart';
part 'card_profile.g.dart';

@freezed
class CardProfile with _$CardProfile {
  const factory CardProfile({
    required String id,
    required String email,
  }) = _CardProfile;

  factory CardProfile.fromJson(Map<String, dynamic> json) =>
      _$CardProfileFromJson(json);

  const CardProfile._();
}
