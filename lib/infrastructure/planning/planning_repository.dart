import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:get/get.dart';

class PlanningRepository implements IPlanningRepository {
  final GraphqlService graphqlService = Get.find();

  // Get activities list for the week dashboard
  @override
  Future<Either<BaseFailure, List<PlanningListWeekActivities$Query$PlanningWeekActivity>>>
      getDashActivitiesList() async {
    final response = await graphqlService.client.execute(PlanningListWeekActivitiesQuery());
    if (response.hasErrors) {
      return left(const BaseFailure.unexpected());
    }
    return right(response.data!.planningListWeekActivities);
  }

  // Get activities list for the selected day
  @override
  Future<Either<BaseFailure, List<PlanningWeekActivities$Query$PlanningWeekActivity>>>
      getWeekActivitiesList(
    DateTime start,
    DateTime end,
  ) async {
    final response = await graphqlService.client.execute(
      PlanningWeekActivitiesQuery(
        variables: PlanningWeekActivitiesArguments(
          start: start.toString(),
          end: end.toString(),
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.unexpected());
    }

    return right(response.data!.planningWeekActivities);
  }

  @override
  Future<Either<BaseFailure, PlanningActivityDetails$Query$ActivityDetails>> getActivityDetails(
    CodesInput codes,
  ) async {
    final response = await graphqlService.client.execute(
      PlanningActivityDetailsQuery(
        variables: PlanningActivityDetailsArguments(
          codes: codes,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.unexpected());
    }

    return right(response.data!.planningActivityDetails);
  }

  @override
  Future<Either<BaseFailure, PlanningRdvDetails$Query$ActivityRdvDetails>> getRdvDetails(
    CodesInput codes,
  ) async {
    final response = await graphqlService.client.execute(
      PlanningRdvDetailsQuery(
        variables: PlanningRdvDetailsArguments(
          codes: codes,
        ),
      ),
    );

    if (response.hasErrors) {
      return left(const BaseFailure.unexpected());
    }

    return right(response.data!.planningRdvDetails);
  }
}
