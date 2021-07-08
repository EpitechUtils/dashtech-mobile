import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardGetUsersByFilter.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/mutation/cardUpdateForLogin.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardGetFiltersValue.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardHistoryByLogin.data.gql.dart';
import 'package:dashtech/infrastructure/core/graphql/schema.schema.gql.dart';

abstract class ICardRepository {
  Future<Either<BaseFailure, GCardGetFilterValuesData_cardGetFilterValues>> getFilterValue(
    GFilterDetailsInput filterDetailsInput,
  );
  Future<Either<BaseFailure, List<GCardGetUsersByFiltersData_cardGetUsersByFilters>>>
      getUsersByFilters(
    GPromoFetchInput filters,
  );
  Future<Either<BaseFailure, List<GCardHistoryByLoginData_cardHistoryByLogin>>> getCardHistory(
    String login,
  );
  Future<Either<BaseFailure, GCardUpdateForLoginData_cardUpdateForLogin>> updateCard(
    String login,
    String nfcTag,
  );
  Future<Either<BaseFailure, void>> removeCard(String login);
}
