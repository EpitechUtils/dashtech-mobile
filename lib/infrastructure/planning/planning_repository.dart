import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/domain/planning/models/activity_rdv_details.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:dashtech/infrastructure/planning/dto/activity_details_dto.dart';
import 'package:dashtech/infrastructure/planning/dto/activity_rdv_details_dto.dart';
import 'package:dashtech/infrastructure/planning/dto/planning_week_activities_dto.dart';
import 'package:dashtech/infrastructure/planning/graphql/planning_queries.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class PlanningRepository implements IPlanningRepository {
  PlanningRepository({
    @required this.graphqlService,
  }) : assert(graphqlService != null);

  GraphqlService graphqlService;

  // Get activities list for the week dashboard
  @override
  Future<Either<BaseFailure, List<PlanningWeekActivity>>>
      getDashActivitiesList() async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        documentNode: gql(planningListWeekActivitiesQuery),
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data['planningListWeekActivities'] as List;
    return right(json
        .map((value) => PlanningWeekActivitiesDto.fromJson(value).toDomain())
        .toList());
  }

  // Get activities list for the selected day
  @override
  Future<Either<BaseFailure, List<PlanningWeekActivity>>> getWeekActivitiesList(
    DateTime start,
    DateTime end,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        documentNode: gql(planningWeekActivitiesQuery),
        variables: {
          'start': start.toIso8601String(),
          'end': end.toIso8601String(),
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data['planningWeekActivities'] as List;
    return right(json
        .map((value) => PlanningWeekActivitiesDto.fromJson(value).toDomain())
        .toList());
  }

  @override
  Future<Either<BaseFailure, ActivityDetails>> getActivityDetails(
    Map<String, String> codes,
  ) async {
    print(codes);
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        documentNode: gql(planningActivityDetailsQuery),
        variables: {
          'codes': codes,
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    return right(
        ActivityDetailsDto.fromJson(result.data['planningActivityDetails'])
            .toDomain());
  }

  @override
  Future<Either<BaseFailure, ActivityRdvDetails>> getRdvDetails(
    Map<String, String> codes,
  ) async {
    print(codes);
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        documentNode: gql(planningRdvDetailsQuery),
        variables: {
          'codes': codes,
        },
      ),
    );

    if (result.hasException) {
      return left(const BaseFailure.unexpected());
    }

    return right(
        ActivityRdvDetailsDto.fromJson(result.data['planningRdvDetails'])
            .toDomain());
  }
}
