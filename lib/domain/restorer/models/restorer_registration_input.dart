import 'package:freezed_annotation/freezed_annotation.dart';

part 'restorer_registration_input.freezed.dart';

@freezed
abstract class RestorerRegistrationInput
    implements _$RestorerRegistrationInput {
  const factory RestorerRegistrationInput({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String sponsor,
  }) = _RestorerRegistrationInput;

  const RestorerRegistrationInput._();
}
