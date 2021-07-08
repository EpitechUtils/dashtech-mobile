import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/graphql/schema.schema.gql.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningActivityDetails.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningActivityDetails.req.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningListWeekActivities.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningListWeekActivities.req.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningRdvDetails.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningRdvDetails.req.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningWeekActivities.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningWeekActivities.req.gql.dart';
import 'package:get/get.dart';

class PlanningRepository implements IPlanningRepository {
  final GraphqlService graphqlService = Get.find();

  // Get activities list for the week dashboard
  @override
  Future<Either<BaseFailure, List<GPlanningListWeekActivitiesData_planningListWeekActivities>>>
      getDashActivitiesList() async {
    final completer = Completer<
        Either<BaseFailure, List<GPlanningListWeekActivitiesData_planningListWeekActivities>>>();
    final request = GPlanningListWeekActivitiesReq((b) => b);

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.unexpected()));
        return;
      }
      completer.complete(right(response.data!.planningListWeekActivities.toList()));
    });

    return completer.future;
  }

  // Get activities list for the selected day
  @override
  Future<Either<BaseFailure, List<GPlanningWeekActivitiesData_planningWeekActivities>>>
      getWeekActivitiesList(
    DateTime start,
    DateTime end,
  ) async {
    final completer =
        Completer<Either<BaseFailure, List<GPlanningWeekActivitiesData_planningWeekActivities>>>();
    final request = GPlanningWeekActivitiesReq(
      (b) => b
        ..vars.start = start.toString()
        ..vars.end = end.toString(),
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.unexpected()));
        return;
      }
      completer.complete(right(response.data!.planningWeekActivities.toList()));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, GPlanningActivityDetailsData_planningActivityDetails>>
      getActivityDetails(
    GCodesInput codes,
  ) async {
    final completer =
        Completer<Either<BaseFailure, GPlanningActivityDetailsData_planningActivityDetails>>();
    final request = GPlanningActivityDetailsReq(
      (b) => b..vars.codes = codes.toBuilder(),
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.unexpected()));
        return;
      }
      completer.complete(right(response.data!.planningActivityDetails));
    });

    return completer.future;
  }

  @override
  Future<Either<BaseFailure, GPlanningRdvDetailsData_planningRdvDetails>> getRdvDetails(
    GCodesInput codes,
  ) async {
    final completer = Completer<Either<BaseFailure, GPlanningRdvDetailsData_planningRdvDetails>>();
    final request = GPlanningRdvDetailsReq(
      (b) => b..vars.codes = codes.toBuilder(),
    );

    graphqlService.client.request(request).listen((response) {
      if (response.loading) return;
      if (response.hasErrors) {
        completer.complete(left(const BaseFailure.unexpected()));
        return;
      }
      completer.complete(right(response.data!.planningRdvDetails));
    });

    return completer.future;
  }
}
