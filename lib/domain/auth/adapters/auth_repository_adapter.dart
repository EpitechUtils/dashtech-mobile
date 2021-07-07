import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/auth/graphql/query/authConfirmEmailCode.data.gql.dart';

abstract class IAuthRepository {
  Future<Either<BaseFailure, bool>> sendDeviceToken(
      String token, String identifier, String platform);
  Future<Either<BaseFailure, bool>> sendEmailCode(String email);
  Future<Either<BaseFailure, GAuthConfirmEmailCodeData_authConfirmEmailCode>> confirmEmailCode(
      String email, String code);
  Future<Either<BaseFailure, bool>> setProfileAutolog(String profileId, String autologUrl);
  Future<Either<AuthFailure, GAuthConfirmEmailCodeData_authConfirmEmailCode>> login(
      String profileId, String email);
  Future<Either<BaseFailure, String>> getProfileIconLink(String picture);
}
