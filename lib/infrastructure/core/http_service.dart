import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenService tokenService = Get.find();

  @override
  Future<void> onRequest(RequestOptions req) async {
    final String token = tokenService.getToken();
    print('Header: Bearer $token');
    if (!token.isNullOrBlank) {
      req.headers.addAll({
        "authorization": 'Bearer $token',
      });
    }
    return req;
  }
}

class HttpService extends GetxService {
  Dio dio;

  Future<HttpService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() async {
    dio = Dio(
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
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    dio.interceptors.add(LogInterceptor());
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(CookieManager(
      PersistCookieJar(dir: '$appDocPath/.cookies'),
    ));
    super.onReady();
  }
}
