import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';

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

  Future<Either<AuthFailure, AuthProfile>> login(
    String profileId,
    String email,
  );

  Future<Either<BaseFailure, String>> getProfileIconLink(String picture);
}
