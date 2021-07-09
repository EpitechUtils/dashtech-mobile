import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class CardRepository implements ICardRepository {
  final GraphqlService graphqlService = Get.find();

  @override
  Future<Either<BaseFailure, CardGetFilterValues$Query$FilterDetails>> getFilterValue(
    FilterDetailsInput filterDetailsInput,
  ) async {
    final response = await graphqlService.client.execute(
      CardGetFilterValuesQuery(
        variables: CardGetFilterValuesArguments(
          details: filterDetailsInput,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.cardGetFilterValues);
  }

  @override
  Future<Either<BaseFailure, List<CardGetUsersByFilters$Query$TrombiUser>>> getUsersByFilters(
    PromoFetchInput filters,
  ) async {
    final response = await graphqlService.client.execute(
      CardGetUsersByFiltersQuery(
        variables: CardGetUsersByFiltersArguments(
          input: filters,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.cardGetUsersByFilters);
  }

  @override
  Future<Either<BaseFailure, List<CardHistoryByLogin$Query$CardHistory>>> getCardHistory(
    String login,
  ) async {
    final response = await graphqlService.client.execute(
      CardHistoryByLoginQuery(
        variables: CardHistoryByLoginArguments(
          email: login,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.cardHistoryByLogin);
  }

  @override
  Future<Either<BaseFailure, CardUpdateForLogin$Mutation$Card>> updateCard(
    String login,
    String nfcTag,
  ) async {
    final response = await graphqlService.client.execute(
      CardUpdateForLoginMutation(
        variables: CardUpdateForLoginArguments(
          email: login,
          nfcTag: nfcTag,
        ),
      ),
    );

    if (response.hasErrors) {
      if (response.statusCode == HttpStatus.conflict) {
        return left(const BaseFailure.conflict());
      }
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.cardUpdateForLogin);
  }

  @override
  Future<Either<BaseFailure, void>> removeCard(
    String login,
  ) async {
    final response = await graphqlService.client.execute(
      CardRemoveMutation(
        variables: CardRemoveArguments(
          email: login,
        ),
      ),
    );

    if (response.hasErrors) {
      if (response.statusCode == HttpStatus.conflict) {
        return left(const BaseFailure.conflict());
      }
      return left(const BaseFailure.notFound());
    }

    return right(response.data!.cardRemove);
  }
}
