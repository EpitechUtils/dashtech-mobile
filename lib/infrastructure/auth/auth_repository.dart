import 'dart:io';

import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/auth/graphql/auth_mutations.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    @required this.graphqlService,
    @required this.tokenService,
  })  : assert(graphqlService != null),
        assert(tokenService != null);

  GraphqlService graphqlService;
  TokenService tokenService;

  // Register device with firebase token
  @override
  Future<Either<AuthFailure, bool>> sendDeviceToken(
    String token,
    String identifier,
    String platform,
  ) async {
    final QueryResult result = await graphqlService.client.mutate(
      MutationOptions(
        documentNode: gql(authRegisterDeviceMutation),
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
        documentNode: gql(authSendEmailConfirmationQuery),
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
        documentNode: gql(authConfirmEmailCodeQuery),
        variables: {
          'email': email,
          'code': code,
        },
      ),
    );

    if (result.hasException) {
      switch (result.exception.statusCode) {
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
        result.data['authConfirmEmailCode'] as Map<String, dynamic>;
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
        documentNode: gql(profileSetAutologMutation),
        variables: {
          'profileId': profileId,
          'autologUrl': autologUrl,
        },
      ),
    );

    if (result.hasException) {
      switch (result.exception.statusCode) {
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

    return right(result.data['profileSetAutolog'] as bool);
  }

  @override
  Future<Either<AuthFailure, AuthProfile>> login(
    String profileId,
    String email,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.noCache,
        documentNode: gql(loginQuery),
        variables: {
          'profileId': profileId,
          'email': email,
        },
      ),
    );

    if (result.hasException) {
      switch (result.exception.statusCode) {
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

    final AuthProfileTokenDto tokenDto =
        AuthProfileTokenDto.fromJson(result.data['login']);
    tokenService.expirationDate.value = tokenDto.expirationTime.toLocal();
    tokenService.token.value = tokenDto.accessToken;

    return right(tokenDto.toDomain());
  }
}
