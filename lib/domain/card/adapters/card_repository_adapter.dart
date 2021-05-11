import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';

abstract class ICardRepository {
  Future<Either<BaseFailure, List<TrombiUser>>> getUsersByFilters(
      PromoFetchInput filters);
}
