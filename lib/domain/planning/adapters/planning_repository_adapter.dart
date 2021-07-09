import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';

abstract class IPlanningRepository {
  Future<Either<BaseFailure, List<PlanningListWeekActivities$Query$PlanningWeekActivity>>>
      getDashActivitiesList();
  Future<Either<BaseFailure, List<PlanningWeekActivities$Query$PlanningWeekActivity>>>
      getWeekActivitiesList(
    DateTime start,
    DateTime end,
  );
  Future<Either<BaseFailure, PlanningActivityDetails$Query$ActivityDetails>> getActivityDetails(
    CodesInput codes,
  );
  Future<Either<BaseFailure, PlanningRdvDetails$Query$ActivityRdvDetails>> getRdvDetails(
    CodesInput codes,
  );
}
