import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/domain/planning/models/activity_rdv_details.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/infrastructure/core/graphql/schema.schema.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningActivityDetails.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningListWeekActivities.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningRdvDetails.data.gql.dart';
import 'package:dashtech/infrastructure/planning/graphql/query/planningWeekActivities.data.gql.dart';

abstract class IPlanningRepository {
  Future<Either<BaseFailure, List<GPlanningListWeekActivitiesData_planningListWeekActivities>>>
      getDashActivitiesList();
  Future<Either<BaseFailure, List<GPlanningWeekActivitiesData_planningWeekActivities>>>
      getWeekActivitiesList(
    DateTime start,
    DateTime end,
  );
  Future<Either<BaseFailure, GPlanningActivityDetailsData_planningActivityDetails>>
      getActivityDetails(
    GCodesInput codes,
  );
  Future<Either<BaseFailure, GPlanningRdvDetailsData_planningRdvDetails>> getRdvDetails(
    GCodesInput codes,
  );
}
