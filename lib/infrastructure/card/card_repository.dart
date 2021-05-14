import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/card/models/card.dart';
import 'package:dashtech/domain/card/models/card_history.dart';
import 'package:dashtech/domain/card/models/card_result.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/graphql/card_queries.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CardRepository implements ICardRepository {
  final GraphqlService graphqlService = Get.find();

  @override
  Future<Either<BaseFailure, List<TrombiUser>>> getUsersByFilters(
    PromoFetchInput filters,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        document: gql(cardGetUsersByFilters),
        variables: {
          "input": {
            "year": filters.year,
            "course": filters.course,
            "promo": filters.promo,
          }
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data!['cardGetUsersByFilters'] as List;
    return right(json.map((value) => TrombiUser.fromJson(value)).toList());
  }

  @override
  Future<Either<BaseFailure, List<CardHistory>>> getCardHistory(
    String login,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        document: gql(cardHistoryByLogin),
        cacheRereadPolicy: CacheRereadPolicy.ignoreAll,
        variables: {
          "email": login,
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data!['cardHistoryByLogin'] as List;
    return right(json.map((value) => CardHistory.fromJson(value)).toList());
  }

  @override
  Future<Either<BaseFailure, Card>> updateCard(
    String login,
    String nfcTag,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        document: gql(cardUpdateForLogin),
        variables: {
          "email": login,
          "nfcTag": nfcTag,
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    return right(Card.fromJson(result.data!['cardUpdateForLogin']));
  }
}
