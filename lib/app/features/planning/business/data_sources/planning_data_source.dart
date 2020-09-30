import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/planning/business/graphql/planning_queries.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@lazySingleton
class PlanningDataSource {
  final GraphQLClient client;

  PlanningDataSource({@required this.client}) : assert(client != null);

  /// Get list planning with events
  Future<List<PlanningActivityModel>> listActivities() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(planningListActivities),
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['planningListActivities'] as List;
    return json.map((dynamic model) => PlanningActivityModel.fromJson(model)).toList();
  }

  /// Get week planning with events
  Future<List<PlanningActivityModel>> listMonthActivities() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(planningMonthActivities),
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['planningMonthActivities'] as List;
    return json.map((dynamic model) => PlanningActivityModel.fromJson(model)).toList();
  }
}
