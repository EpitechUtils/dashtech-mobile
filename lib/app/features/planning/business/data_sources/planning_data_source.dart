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

  /// Get week planning with events
  Future<List<PlanningActivityModel>> weekActivities() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(planningWeekActivities),
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['planningWeekActivities'] as List;
    return json.map((dynamic model) => PlanningActivityModel.fromJson(model)).toList();
  }
}
