import 'dart:io';

import 'package:flutter_file_store/infrastructure/core/token_service.dart';
import 'package:flutter_file_store/presentation/core/utils/logger_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

extension GraphQLErrorX on OperationException {
  int get statusCode {
    print("----------------- " + graphqlErrors.first.toString());
    return graphqlErrors?.first?.extensions['exception']['status'] as int;
  }
}

class GraphqlService extends GetxService {
  final TokenService tokenService = Get.find();
  GraphQLClient client;

  Future<GraphqlService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() {
    final HttpLink httpLink = HttpLink(
      uri: '${DotEnv().env['BASE_URL']}/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () {
        final String token = tokenService.getToken();
        return 'Bearer $token';
      },
    );
    final Link link = authLink.concat(httpLink);

    client = GraphQLClient(
      cache: InMemoryCache(),
      link: link,
    );
    super.onReady();
  }
}
