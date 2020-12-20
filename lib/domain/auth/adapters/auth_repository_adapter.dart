import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
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

  Future<Either<AuthFailure, bool>> setProfileAutolog(
    String profileId,
    String autologUrl,
  );

  Future<Either<AuthFailure, bool>> login(
    String profileId,
    String email,
  );
}
