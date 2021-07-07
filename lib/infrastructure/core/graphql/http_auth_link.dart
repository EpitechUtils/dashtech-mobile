import 'dart:async';

import 'package:ferry/ferry.dart';
import "package:gql_error_link/gql_error_link.dart";
import "package:gql_exec/gql_exec.dart";
import 'package:gql_http_link/gql_http_link.dart';
import "package:gql_link/gql_link.dart";
import "package:gql_transform_link/gql_transform_link.dart";

class HttpAuthLink extends Link {
  final Function getToken;
  final String graphQLEndpoint;

  late String? _token;
  late Link _link;

  HttpAuthLink({
    required this.getToken,
    required this.graphQLEndpoint,
  }) {
    _link = Link.from([
      TransformLink(requestTransformer: transformRequest),
      ErrorLink(onException: handleException),
      HttpLink(graphQLEndpoint),
    ]);
  }

  Future<void> updateToken() async {
    _token = await getToken();
  }

  Stream<Response> handleException(
    Request request,
    NextLink forward,
    LinkException exception,
  ) async* {
    if (exception is HttpLinkServerException && exception.response.statusCode == 401) {
      await updateToken();

      yield* forward(request);

      return;
    }

    final message = exception is HttpLinkServerException
        ? exception.response.reasonPhrase
        : exception.toString();

    Zone.current.handleUncaughtError(message!, StackTrace.fromString(''));

    throw exception;
  }

  Request transformRequest(Request request) => request.updateContextEntry<HttpLinkHeaders>(
        (headers) => HttpLinkHeaders(
          headers: <String, String>{
            ...headers?.headers ?? <String, String>{},
            "Authorization": _token!,
          },
        ),
      );

  @override
  Stream<Response> request(Request request, [forward]) async* {
    if (_token == null) {
      await updateToken();
    }

    yield* _link.request(request, forward);
  }
}
