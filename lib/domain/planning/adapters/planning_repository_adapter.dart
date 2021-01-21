import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_file_store/domain/core/failures/base_failure.dart';

abstract class IPlanningRepository {
  Future<Either<BaseFailure, bool>> getDashActivitiesList();
}
