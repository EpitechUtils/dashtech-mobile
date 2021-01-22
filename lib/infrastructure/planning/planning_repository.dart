import 'dart:io';

import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/auth/graphql/auth_mutations.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dashtech/infrastructure/planning/dto/planning_week_activities_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:dashtech/infrastructure/planning/graphql/planning_queries.dart';
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
  Future<Either<BaseFailure, List<PlanningActivity>>> getDayActivitiesList(
    DateTime date,
  ) async {
    final QueryResult result = await graphqlService.client.query(
      QueryOptions(
        documentNode: gql(planningDayActivitiesQuery),
        variables: {
          'date': date.toIso8601String(),
        },
      ),
    );

    if (result.hasException) {
      print(result.data);
      return left(const BaseFailure.unexpected());
    }

    final List json = result.data['planningDayActivities'] as List;
    return right(
        json.map((value) => PlanningActivity.fromJson(value)).toList());
  }
}
