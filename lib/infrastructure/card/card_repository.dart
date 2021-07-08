import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/graphql/mutation/cardRemove.req.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/mutation/cardUpdateForLogin.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/mutation/cardUpdateForLogin.req.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardGetFiltersValue.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardGetFiltersValue.req.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardGetUsersByFilter.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardGetUsersByFilter.req.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardHistoryByLogin.data.gql.dart';
import 'package:dashtech/infrastructure/card/graphql/query/cardHistoryByLogin.req.gql.dart';
import 'package:dashtech/infrastructure/core/graphql/schema.schema.gql.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class CardRepository implements ICardRepository {
  final GraphqlService graphqlService = Get.find();

  @override
  Future<Either<BaseFailure, GCardGetFilterValuesData_cardGetFilterValues>> getFilterValue(
    GFilterDetailsInput filterDetailsInput,
  ) async {
    final completer =
        Completer<Either<BaseFailure, GCardGetFilterValuesData_cardGetFilterValues>>();
    final request = GCardGetFilterValuesReq(
      (b) => b..vars.details = filterDetailsInput.toBuilder(),
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.cardGetFilterValues));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, List<GCardGetUsersByFiltersData_cardGetUsersByFilters>>>
      getUsersByFilters(
    GPromoFetchInput filters,
  ) async {
    final completer =
        Completer<Either<BaseFailure, List<GCardGetUsersByFiltersData_cardGetUsersByFilters>>>();
    final request = GCardGetUsersByFiltersReq(
      (b) => b..vars.input = filters.toBuilder(),
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.cardGetUsersByFilters.toList()));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, List<GCardHistoryByLoginData_cardHistoryByLogin>>> getCardHistory(
    String login,
  ) async {
    final completer =
        Completer<Either<BaseFailure, List<GCardHistoryByLoginData_cardHistoryByLogin>>>();
    final request = GCardHistoryByLoginReq(
      (b) => b..vars.email = login,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.notFound()));
        return;
      }
      completer.complete(right(response.data!.cardHistoryByLogin.toList()));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, GCardUpdateForLoginData_cardUpdateForLogin>> updateCard(
    String login,
    String nfcTag,
  ) async {
    final completer = Completer<Either<BaseFailure, GCardUpdateForLoginData_cardUpdateForLogin>>();
    final request = GCardUpdateForLoginReq(
      (b) => b
        ..vars.email = login
        ..vars.nfcTag = nfcTag,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        if (response.statusCode == HttpStatus.conflict) {
          completer.complete(left(const BaseFailure.conflict()));
        } else {
          completer.complete(left(const BaseFailure.notFound()));
        }
        return;
      }
      completer.complete(right(response.data!.cardUpdateForLogin));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, void>> removeCard(
    String login,
  ) async {
    final completer = Completer<Either<BaseFailure, void>>();
    final request = GCardRemoveReq(
      (b) => b..vars.email = login,
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        if (response.statusCode == HttpStatus.conflict) {
          completer.complete(left(const BaseFailure.conflict()));
        } else {
          completer.complete(left(const BaseFailure.notFound()));
        }
        return;
      }
      completer.complete(right(response.data!.cardRemove));
    });

    return completer.future;
  }
}
