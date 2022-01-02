import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/infrastructure/core/provider/auth_provider.connect.dart';
import 'package:dashtech/infrastructure/core/service/auth_service.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class AuthRepository implements IAuthRepository {
  final GraphqlService graphqlService = Get.find();
  final AuthService authService = Get.find();
  final StorageService storageService = Get.find();
  final AuthProvider authProvider = Get.find();

  // Register device with firebase token
  @override
  Future<Either<BaseFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  ) async {
    final response = await graphqlService.client.execute(
      DeviceRegisterMutation(
        variables: DeviceRegisterArguments(
          identifier: identifier,
          platform: platform,
          token: token,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.deviceRegister);
  }

  // Send email verification to user
  @override
  Future<Either<BaseFailure, bool>> sendEmailCode(String email) async {
    final response = await graphqlService.client.execute(
      UserSendEmailCodeQuery(
        variables: UserSendEmailCodeArguments(
          email: email,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.userSendEmailCode);
  }

  // Validate code sent by email
  @override
  Future<Either<BaseFailure, UserConfirmEmailCode$Query$UserEntity>>
      confirmEmailCode(
    String email,
    String code,
  ) async {
    final response = await graphqlService.client.execute(
      UserConfirmEmailCodeQuery(
        variables: UserConfirmEmailCodeArguments(
          email: email,
          code: code,
        ),
      ),
    );

    if (response.hasErrors) {
      switch (response.statusCode) {
        case HttpStatus.notFound:
          return left(const BaseFailure.notFound());
        case HttpStatus.conflict:
          return left(const BaseFailure.conflict());
        case HttpStatus.unauthorized:
          return left(const BaseFailure.unauthorized());
        default:
          return left(const BaseFailure.unexpected());
      }
    }

    return right(response.data!.userConfirmEmailCode);
  }

  // Set profile autolog url if user email iss same as intranet logged user
  // TODO: jwt login ?
  @override
  Future<Either<BaseFailure, bool>> linkUserToIntranetProfile(
    String userId,
    String jwt,
  ) async {
    final response = await graphqlService.client.execute(
      UserLinkToIntranetMutation(
        variables: UserLinkToIntranetArguments(
          userId: userId,
          jwtToken: jwt,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.userLinkToIntranet);
  }

  @override
  Future<Either<AuthFailure, AuthProfile>> login(
    String userId,
    String email,
  ) async {
    try {
      final AuthProfileTokenDto tokenDto =
          await authProvider.login(userId, email);
      final AuthProfile authProfile = tokenDto.toDomain();

      String fullName = authProfile.email.split('@')[0].replaceAll('.', ' ');
      authService.expirationDate(tokenDto.expirationTime.toLocal());
      authService.token(tokenDto.accessToken);
      storageService.box.write('fullName', fullName);
      storageService.box.write('email', authProfile.email);
      return right(authProfile);
    } catch (e) {
      print(e);
      return left(const AuthFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, String>> getProfileIconLink(
    String picture,
  ) async {
    final response = await graphqlService.client.execute(
      UserGetIconLinkByPictureQuery(
        variables: UserGetIconLinkByPictureArguments(
          picture: picture,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.userGetIconLinkByPicture);
  }
}
