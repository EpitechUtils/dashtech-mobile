import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';

abstract class IAuthRepository {
  Future<Either<BaseFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  );

  Future<Either<BaseFailure, bool>> sendEmailCode(
    String email,
  );

  Future<Either<BaseFailure, UserConfirmEmailCode$Query$UserEntity>>
      confirmEmailCode(
    String email,
    String code,
  );

  Future<Either<BaseFailure, bool>> linkUserToIntranetProfile(
    String profileId,
    String jwtToken,
  );

  Future<Either<AuthFailure, AuthProfile>> login(
    String userId,
    String email,
  );

  Future<Either<BaseFailure, String>> getProfileIconLink(
    String picture,
  );
}
