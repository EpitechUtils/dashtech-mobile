import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/models/card.dart';
import 'package:dashtech/domain/card/models/card_history.dart';
import 'package:dashtech/domain/card/models/filters/filter_details.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/input/filter_details_input.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';

abstract class ICardRepository {
  Future<Either<BaseFailure, FilterDetails>> getFilterValue(
    FilterDetailsInput filterDetailsInput,
  );
  Future<Either<BaseFailure, List<TrombiUser>>> getUsersByFilters(
    PromoFetchInput filters,
  );
  Future<Either<BaseFailure, List<CardHistory>>> getCardHistory(
    String login,
  );
  Future<Either<BaseFailure, Card>> updateCard(
    String login,
    String nfcTag,
  );
  Future<Either<BaseFailure, void>> removeCard(
    String login,
  );
}
