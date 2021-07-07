import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/auth/graphql/mutation/profileRegisterDevice.req.gql.dart';
import 'package:dashtech/infrastructure/auth/graphql/mutation/profileSetAutolog.req.gql.dart';
import 'package:dashtech/infrastructure/auth/graphql/query/authConfirmEmailCode.data.gql.dart';
import 'package:dashtech/infrastructure/auth/graphql/query/authConfirmEmailCode.req.gql.dart';
import 'package:dashtech/infrastructure/auth/graphql/query/authSendEmailConfirmation.req.gql.dart';
import 'package:dashtech/infrastructure/auth/graphql/query/profileGetIconLinkByPicture.req.gql.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/core/service/http_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/infrastructure/core/service/token_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AuthRepository implements IAuthRepository {
  final GraphqlService graphqlService = Get.find();
  final HttpService httpService = Get.find();
  final TokenService tokenService = Get.find();
  final StorageService storageService = Get.find();

  // Register device with firebase token
  @override
  Future<Either<BaseFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  ) async {
    final completer = Completer<Either<BaseFailure, bool>>();
    final request = GProfileRegisterDeviceReq(
      (b) => b
        ..vars.identifier = identifier
        ..vars.platform = platform
        ..vars.token = token,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.profileRegisterDevice));
    });

    return completer.future;
  }

  // Send email verification to user
  @override
  Future<Either<BaseFailure, bool>> sendEmailCode(String email) async {
    final completer = Completer<Either<BaseFailure, bool>>();
    final request = GAuthSendEmailConfirmationReq(
      (b) => b..vars.email = email,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.authSendEmailConfirmation));
    });

    return completer.future;
  }

  // Validate code sent by email
  @override
  Future<Either<BaseFailure, GAuthConfirmEmailCodeData_authConfirmEmailCode>> confirmEmailCode(
    String email,
    String code,
  ) async {
    final completer =
        Completer<Either<BaseFailure, GAuthConfirmEmailCodeData_authConfirmEmailCode>>();
    final request = GAuthConfirmEmailCodeReq(
      (b) => b
        ..vars.email = email
        ..vars.code = code,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.authConfirmEmailCode!));
    });

    return completer.future;
  }

  // Set profile autolog url if user email iss same as intranet logged user
  // TODO: jwt login ?
  @override
  Future<Either<BaseFailure, bool>> setProfileAutolog(
    String profileId,
    String autologUrl,
  ) async {
    final completer = Completer<Either<BaseFailure, bool>>();
    final request = GProfileSetAutologReq(
      (b) => b
        ..vars.profileId = profileId
        ..vars.autologUrl = autologUrl,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.profileSetAutolog));
    });

    return completer.future;
  }

  @override
  Future<Either<AuthFailure, GAuthConfirmEmailCodeData_authConfirmEmailCode>> login(
    String profileId,
    String email,
  ) async {
    try {
      final response = await httpService.connect.post(
        DotEnv().env['BASE_URL']! + '/auth/login',
        {
          'profileId': profileId,
          'email': email,
        },
      );

      final AuthProfileTokenDto tokenDto = AuthProfileTokenDto.fromJson(response.body);
      final GAuthConfirmEmailCodeData_authConfirmEmailCode authProfile = tokenDto.toDomain();

      print(tokenDto.toString());
      print(authProfile.toString());

      String fullName = authProfile.email.split('@')[0].replaceAll('.', ' ');
      tokenService.expirationDate.value = tokenDto.expirationTime.toLocal();
      tokenService.token.value = tokenDto.accessToken;
      storageService.box.write('fullName', fullName);
      storageService.box.write('email', authProfile.email);
      return right(authProfile);
    } catch (e) {
      return left(const AuthFailure.unexpected());
    }
  }

  @override
  Future<Either<BaseFailure, String>> getProfileIconLink(
    String picture,
  ) async {
    final completer = Completer<Either<BaseFailure, String>>();
    final request = GProfileGetIconLinkByPictureReq((b) => b..vars.picture = picture);

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.profileGetIconLinkByPicture));
    });

    return completer.future;
  }
}
