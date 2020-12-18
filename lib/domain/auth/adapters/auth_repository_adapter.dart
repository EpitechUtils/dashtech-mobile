import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/failures/email_verification_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:flutter_file_store/domain/restorer/models/restorer.dart';
import 'package:flutter_file_store/domain/restorer/models/restorer_registration_input.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  );

  Future<Either<AuthFailure, bool>> sendEmailCode(String email);
  Future<Either<AuthFailure, AuthProfile>> confirmEmailCode(
    String email,
    String code,
  );

  Future<void> logout();
  Future<Either<AuthFailure, Unit>> registerAsPersonal(String email);
  Future<Either<AuthFailure, Restorer>> registerAsRestorer(
    RestorerRegistrationInput input,
  );
  Future<Either<EmailVerificationFailure, bool>> verifyEmailCode(String code);
  Future<Either<AuthFailure, Unit>> sendBackEmail();
}
