import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';

abstract class IPlanningRepository {
  Future<Either<BaseFailure, List<dynamic>>> getDashActivitiesList();

  Future<Either<BaseFailure, List<dynamic>>> getWeekActivitiesList(
    DateTime start,
    DateTime end,
  );

  Future<Either<BaseFailure, dynamic>> getActivityDetails(
    dynamic codes,
  );

  Future<Either<BaseFailure, dynamic>> getRdvDetails(
    dynamic codes,
  );
}
