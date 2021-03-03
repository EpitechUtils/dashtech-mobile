import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';

abstract class IPlanningRepository {
  Future<Either<BaseFailure, List<PlanningWeekActivity>>>
      getDashActivitiesList();
  Future<Either<BaseFailure, List<PlanningWeekActivity>>> getWeekActivitiesList(
    DateTime start,
    DateTime end,
  );

  Future<Either<BaseFailure, PlanningActivity>> getActivityDetails(
    Map<String, String> codes,
  );
}
