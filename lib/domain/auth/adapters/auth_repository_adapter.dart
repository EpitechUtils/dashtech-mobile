import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/failures/email_verification_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:flutter_file_store/domain/auth/models/credentials.dart';
import 'package:flutter_file_store/domain/restorer/models/restorer.dart';
import 'package:flutter_file_store/domain/restorer/models/restorer_registration_input.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<AuthFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  );

  Future<void> logout();
  Future<Either<AuthFailure, AuthProfile>> signin(Credentials credentials);
  Future<Either<AuthFailure, Unit>> registerAsPersonal(String email);
  Future<Either<AuthFailure, Restorer>> registerAsRestorer(
    RestorerRegistrationInput input,
  );
  Future<Either<EmailVerificationFailure, bool>> verifyEmailCode(String code);
  Future<Either<AuthFailure, Unit>> sendBackEmail();
}
