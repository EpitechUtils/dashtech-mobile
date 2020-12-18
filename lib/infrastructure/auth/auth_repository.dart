import 'dart:io';

import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/failures/email_verification_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:flutter_file_store/domain/restorer/models/restorer.dart';
import 'package:flutter_file_store/domain/restorer/models/restorer_registration_input.dart';
import 'package:flutter_file_store/infrastructure/auth/graphql/auth_mutations.dart';
import 'package:flutter_file_store/infrastructure/core/graphql_service.dart';
import 'package:flutter_file_store/infrastructure/core/token_service.dart';
import 'package:flutter_file_store/infrastructure/restorer/dto/restorer_dto.dart';
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
          return left(const AuthFailure.profileNotFound());
        case HttpStatus.conflict:
          return left(const AuthFailure.invalidCode());
        case HttpStatus.unauthorized:
          return left(const AuthFailure.expiredCode());
        default:
          return left(const AuthFailure.unexpected());
      }
    }

    final Map<String, dynamic> json =
        result.data['authConfirmEmailCode'] as Map<String, dynamic>;
    print(json);
    return right(AuthProfile.fromJson(json));
  }

  @override
  Future<Either<AuthFailure, Restorer>> registerAsRestorer(
    RestorerRegistrationInput input,
  ) async {
    final QueryResult result =
        await graphqlService.client.mutate(MutationOptions(
      documentNode: gql(registerAsTherapistMutation),
      variables: {
        'restorerRegistrationInput': {
          'email': input.email,
          'password': input.password,
          'firstName': input.firstName,
          'lastName': input.lastName,
          'sponsorCode': input.sponsor
        },
      },
    ));

    if (result.hasException) {
      switch (result.exception.statusCode) {
        /*case HttpStatus.unauthorized:
          return left(const AuthFailure.domainUnauthorized());
        case HttpStatus.conflict:
          return left(const AuthFailure.alreadyExist());*/
        default:
          return left(const AuthFailure.unexpected());
      }
    }

    final Map<String, dynamic> json =
        result.data['registerAsRestorer'] as Map<String, dynamic>;
    return right(RestorerDto.fromJson(json).toDomain());
  }

  @override
  Future<Either<AuthFailure, Unit>> registerAsPersonal(String email) async {
    final QueryResult result =
        await graphqlService.client.mutate(MutationOptions(
      documentNode: gql(registerAsPersonalMutation),
      variables: {
        'personalRegistrationInput': {
          'email': email,
        },
      },
    ));
    if (result.hasException) {
      switch (result.exception.statusCode) {
        /*case HttpStatus.unauthorized:
          return left(const AuthFailure.domainUnauthorized());
        case HttpStatus.conflict:
          return left(const AuthFailure.alreadyExist());*/
        default:
          return left(const AuthFailure.unexpected());
      }
    }
    return right(unit);
  }

  @override
  Future<void> logout() async {
    try {
      //await httpService.dio.delete<void>('/auth/logout');
      tokenService.clearToken();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<EmailVerificationFailure, bool>> verifyEmailCode(
      String code) async {
    final QueryResult result =
        await graphqlService.client.mutate(MutationOptions(
      documentNode: gql(validateEmailMutation),
      variables: {
        'emailCode': code,
      },
    ));

    if (result.hasException) {
      switch (result.exception.statusCode) {
        case HttpStatus.unauthorized:
          return left(const EmailVerificationFailure.unauthorized());
        case HttpStatus.badRequest:
          return left(const EmailVerificationFailure.wrongCode());
        default:
          return left(const EmailVerificationFailure.unexpected());
      }
    }

    final String status = result.data['validateEmail']['status'] as String;
    return right(status == "OK");
  }

  @override
  Future<Either<AuthFailure, Unit>> sendBackEmail() async {
    final QueryResult result = await graphqlService.client.query(QueryOptions(
      documentNode: gql(sendBackEmailMutation),
    ));
    if (result.hasException) {
      return left(const AuthFailure.unexpected());
    }
    return right(unit);
  }
}
