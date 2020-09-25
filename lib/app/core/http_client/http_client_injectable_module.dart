import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HttpClientInjectableModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: "https://intra.epitech.eu",
          connectTimeout: 20000,
          receiveTimeout: 20000,
          validateStatus: (status) => status < 500,
          headers: {
            'Accept': "application/json",
            'Content-Type': "application/json",
          },
          responseType: ResponseType.json,
          followRedirects: true,
          receiveDataWhenStatusError: true,
        ),
      );
}
