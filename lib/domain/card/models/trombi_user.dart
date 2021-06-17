import 'package:dashtech/domain/card/models/card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trombi_user.freezed.dart';
part 'trombi_user.g.dart';

@freezed
class TrombiUser with _$TrombiUser {
  const factory TrombiUser({
    required String login,
    required String title,
    required String location,
    String? picture,
    required String prenom,
    required String nom,
    Card? card,
  }) = _TrombiUser;

  factory TrombiUser.fromJson(Map<String, dynamic> json) => _$TrombiUserFromJson(json);

  const TrombiUser._();
}
