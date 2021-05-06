import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/auth/graphql/auth_mutations.dart';
import 'package:dashtech/infrastructure/auth/graphql/auth_queries.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:dashtech/infrastructure/core/http_service.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required this.graphqlService,
    required this.httpService,
    required this.tokenService,
    required this.storageService,
  });

  GraphqlService graphqlService;
  HttpService httpService;
  TokenService tokenService;
  StorageService storageService;

  // Register device with firebase token
  @override
  Future<Either<AuthFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  ) async {
    final QueryResult result = await graphqlService.client.mutate(
      MutationOptions(
        document: gql(authRegisterDeviceMutation),
        variables: {
          'token': token,
          'platform': platform,
          'identifier': identifier,
        },
      ),
    );

    return right(!result.hasException);
  }

  // Send email verification to user
  @override
  Future<Either<AuthFailure, bool>> sendEmailCode(String email) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(authSendEmailConfirmationQuery),
        variables: {'email': email},
      ),
    );

    if (result.hasException) {
      return left(const AuthFailure.unexpected());
    }

    return right(true);
  }

  // Validate code sent by email
  @override
  Future<Either<AuthFailure, AuthProfile>> confirmEmailCode(
    String email,
    String code,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(authConfirmEmailCodeQuery),
        variables: {
          'email': email,
          'code': code,
        },
      ),
    );

    if (result.hasException) {
      switch (result.exception!.statusCode) {
        case HttpStatus.notFound:
          return left(const AuthFailure.notFound());
        case HttpStatus.conflict:
          return left(const AuthFailure.conflict());
        case HttpStatus.unauthorized:
          return left(const AuthFailure.unauthorized());
        default:
          return left(const AuthFailure.unexpected());
      }
    }

    final Map<String, dynamic> json =
        result.data!['authConfirmEmailCode'] as Map<String, dynamic>;
    return right(AuthProfile.fromJson(json));
  }

  // Set profile autolog url if user email iss same as intranet logged user
  // TODO: jwt login ?
  @override
  Future<Either<AuthFailure, bool>> setProfileAutolog(
    String profileId,
    String autologUrl,
  ) async {
    final QueryResult result = await graphqlService.client.mutate(
      MutationOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(profileSetAutologMutation),
        variables: {
          'profileId': profileId,
          'autologUrl': autologUrl,
        },
      ),
    );

    if (result.hasException) {
      switch (result.exception!.statusCode) {
        case HttpStatus.notFound:
          return left(const AuthFailure.notFound());
        case HttpStatus.conflict:
          return left(const AuthFailure.conflict());
        case HttpStatus.unauthorized:
          return left(const AuthFailure.unauthorized());
        default:
          return left(const AuthFailure.unexpected());
      }
    }

    return right(result.data!['profileSetAutolog'] as bool);
  }

  @override
  Future<Either<AuthFailure, AuthProfile>> login(
    String profileId,
    String email,
  ) async {
    try {
      final dio.Response<Map<String, dynamic>> response =
          await httpService.dio.post<Map<String, dynamic>>(
        DotEnv.env['BASE_URL']! + '/auth/login',
        data: {
          'profileId': profileId,
          'email': email,
        },
      );

      final AuthProfileTokenDto tokenDto =
          AuthProfileTokenDto.fromJson(response.data!);
      final AuthProfile authProfile = tokenDto.toDomain();

      print(tokenDto.toString());
      print(authProfile.toString());

      String fullName = authProfile.email.split('@')[0].replaceAll('.', ' ');
      tokenService.expirationDate.value = tokenDto.expirationTime.toLocal();
      tokenService.token.value = tokenDto.accessToken;
      storageService.box.write('fullName', fullName);
      storageService.box.write('email', authProfile.email);
      return right(authProfile);
    } on dio.DioError catch (e) {
      print(e);
      return left(const AuthFailure.unexpected());
      switch (e.response!.statusCode) {
        case HttpStatus.notFound:
          return left(const AuthFailure.notFound());
        case HttpStatus.conflict:
          return left(const AuthFailure.conflict());
        case HttpStatus.unauthorized:
          return left(const AuthFailure.unauthorized());
        default:
          return left(const AuthFailure.unexpected());
      }
    }
  }

  @override
  Future<Either<BaseFailure, String>> getProfileIconLink(
    String picture,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        document: gql(profileGetIconLinkByPictureQuery),
        variables: {
          'picture': picture,
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    return right(result.data!['profileGetIconLinkByPicture']);
  }
}
