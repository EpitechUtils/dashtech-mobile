import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/graphql/graphql.dart';

@module
abstract class GraphqlInjectableModule {
  @lazySingleton
  GraphQLClient get graphqlClient => Graphql.client();
}
