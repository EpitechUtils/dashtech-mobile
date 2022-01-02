import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';

abstract class ICardRepository {
  Future<Either<BaseFailure, CardGetFilterValues$Query$FilterDetailsType>>
      getFilterValue(
    FilterDetailsInput filterDetailsInput,
  );

  Future<Either<BaseFailure, List<CardGetUsersByFilters$Query$TrombiUserType>>>
      getUsersByFilters(
    PromoFetchInput filters,
  );

  Future<Either<BaseFailure, List<CardHistoryByLogin$Query$CardHistoryEntity>>>
      getCardHistory(
    String login,
  );

  Future<Either<BaseFailure, CardUpdateForLogin$Mutation$CardEntity>>
      updateCard(
    String login,
    String nfcTag,
  );

  Future<Either<BaseFailure, void>> removeCard(
    String login,
  );
}
