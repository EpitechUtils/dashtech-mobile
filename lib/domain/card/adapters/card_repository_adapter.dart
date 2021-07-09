import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';

abstract class ICardRepository {
  Future<Either<BaseFailure, CardGetFilterValues$Query$FilterDetails>> getFilterValue(
    FilterDetailsInput filterDetailsInput,
  );
  Future<Either<BaseFailure, List<CardGetUsersByFilters$Query$TrombiUser>>> getUsersByFilters(
    PromoFetchInput filters,
  );
  Future<Either<BaseFailure, List<CardHistoryByLogin$Query$CardHistory>>> getCardHistory(
    String login,
  );
  Future<Either<BaseFailure, CardUpdateForLogin$Mutation$Card>> updateCard(
    String login,
    String nfcTag,
  );
  Future<Either<BaseFailure, void>> removeCard(
    String login,
  );
}
