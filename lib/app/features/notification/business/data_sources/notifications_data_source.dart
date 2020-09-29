import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/notification/business/graphql/notifications_queries.dart';
import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@lazySingleton
class NotificationsDataSource {
  final GraphQLClient client;

  NotificationsDataSource({@required this.client}) : assert(client != null);

  /// Find all saved settings
  Future<List<NotificationModel>> findNotifications() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(notificationsAll),
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['notificationsAll'] as List;
    return json.map((dynamic model) => NotificationModel.fromJson(model)).toList();
  }
}
