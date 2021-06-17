import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/domain/planning/models/activity_rdv_details.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';

abstract class IPlanningRepository {
  Future<Either<BaseFailure, List<PlanningWeekActivity>>> getDashActivitiesList();
  Future<Either<BaseFailure, List<PlanningWeekActivity>>> getWeekActivitiesList(
    DateTime start,
    DateTime end,
  );

  Future<Either<BaseFailure, ActivityDetails>> getActivityDetails(
    Map<String, String> codes,
  );
  Future<Either<BaseFailure, ActivityRdvDetails>> getRdvDetails(
    Map<String, String> codes,
  );
}
