import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/graphql/friend_queries.dart';

@injectable
@lazySingleton
class FriendDataSource {
  final GraphQLClient client;

  FriendDataSource({@required this.client}) : assert(client != null);

  /// Check if this player have already pending request
  Future<bool> checkIsFriendRequested(String username) async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(isFriendRequestedWith),
      variables: {
        'username': username,
      },
    ));
    if (result.hasException) {
      manageError(result);
    }
    return result.data['userIsFriendRequested'] as bool;
  }

  /// Send friend request
  Future<bool> sendFriendRequest(String username) async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(requestNewFriend),
      variables: {
        'username': username,
      },
    ));
    if (result.hasException) {
      manageError(result);
    }
    return result.data['userSendFriendRequest'] as bool;
  }
}
