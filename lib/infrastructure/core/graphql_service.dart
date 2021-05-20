import 'dart:io';

import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

extension GraphQLErrorX on OperationException {
  int get statusCode =>
      graphqlErrors.first.extensions!['exception']['status'] as int;

  String get statusMessage => graphqlErrors.first.message;
}

class GraphqlService extends GetxService {
  final TokenService tokenService = Get.find();
  late GraphQLClient client;

  Future<GraphqlService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() {
    final HttpLink httpLink = HttpLink('${DotEnv.env['BASE_URL']}/graphql');

    final AuthLink authLink = AuthLink(
      getToken: () {
        final String? token = tokenService.getToken();
        if (token == null) return null;
        return 'Bearer $token';
      },
    );
    final Link link = authLink.concat(httpLink);

    client = GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: link,
    );
    super.onReady();
  }
}
