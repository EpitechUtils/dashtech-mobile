import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:epitech_intranet_mobile/app/core/error/failures.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/injection.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

void manageError(QueryResult result) {
  if (result.exception.clientException is NetworkException) {
    if (result.exception.clientException.message.contains('401')) {
      getIt<AuthBloc>().add(AuthEvent.logout());
      return;
    }
    throw ServerFailure();
  }
  throw BusinessFailure(
    message: result.exception.graphqlErrors.first.message,
  );
}
