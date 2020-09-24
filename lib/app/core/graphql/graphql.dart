import 'dart:async';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:epitech_intranet_mobile/injection.dart';

final DefaultPolicies defaultPolicies = DefaultPolicies(
  mutate: Policies(
    error: ErrorPolicy.all,
    fetch: FetchPolicy.noCache,
  ),
  query: Policies(
    error: ErrorPolicy.all,
    fetch: FetchPolicy.noCache,
  ),
  watchQuery: Policies(
    error: ErrorPolicy.ignore,
    fetch: FetchPolicy.noCache,
  ),
);

class Graphql {
  static client() {
    final HttpLink httpLink = HttpLink(
      uri: DotEnv().env['BASE_URL'] + '/graphql',
    );

    return GraphQLClient(
      cache: InMemoryCache(),
      defaultPolicies: defaultPolicies,
      link: authLink().concat(httpLink),
    );
  }

  static CustomAuthLink authLink() {
    return CustomAuthLink(getHeaders: () async {
      final FlutterSecureStorage secureStorage = getIt<FlutterSecureStorage>();
      final String csrf = await secureStorage.read(key: 'csrf');
      final String jwtToken = await secureStorage.read(key: 'token');

      return {
        'x-csrf-token': StringUtils.isNotNullOrEmpty(csrf) ? csrf : '',
        'authorization': StringUtils.isNotNullOrEmpty(jwtToken) ? "Bearer " + jwtToken : '',
      };
    });
  }
}

typedef GetHeaders = Future<Map<String, String>> Function();

class CustomAuthLink extends Link {
  CustomAuthLink({
    this.getHeaders,
  }) : super(
          request: (Operation operation, [NextLink forward]) {
            StreamController<FetchResult> controller;
            Future<void> onListen() async {
              try {
                final Map<String, String> headers = await getHeaders();
                operation.setContext(<String, Map<String, String>>{'headers': headers});
              } catch (error) {
                controller.addError(error);
              }
              await controller.addStream(forward(operation));
              await controller.close();
            }

            controller = StreamController<FetchResult>(onListen: onListen);
            return controller.stream;
          },
        );

  GetHeaders getHeaders;
}
