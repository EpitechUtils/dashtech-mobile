import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/business/graphql/dashboard_queries.dart';
import 'package:epitech_intranet_mobile/app/features/module/models/module_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@lazySingleton
class DashboardDataSource {
  final GraphQLClient client;

  DashboardDataSource({@required this.client}) : assert(client != null);

  /// Get current modules
  Future<List<ModuleModel>> currentModules() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(moduleCurrent),
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['moduleCurrent'] as List;
    return json.map((dynamic model) => ModuleModel.fromJson(model)).toList();
  }
}
