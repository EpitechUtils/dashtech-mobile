import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class AuthInterceptor extends Interceptor {
  final TokenService tokenService = Get.find();

  @override
  Future<void> onRequest(
    RequestOptions req,
    RequestInterceptorHandler handler,
  ) async {
    final String? token = tokenService.getToken();
    if (token != null) {
      req.headers.addAll({
        "authorization": 'Bearer $token',
      });
    }
  }
}

class HttpService extends GetxService {
  late Dio dio;

  Future<HttpService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() async {
    dio = Dio();
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    PersistCookieJar cookieJar = PersistCookieJar(storage: FileStorage(appDocPath + "/.cookies/"));
    dio.interceptors.add(CookieManager(cookieJar));
    dio.options = BaseOptions(
      baseUrl: "https://intra.epitech.eu",
      connectTimeout: 20000,
      receiveTimeout: 20000,
      validateStatus: (status) => status! < 500,
      headers: {
        'Accept': "application/json",
      },
      responseType: ResponseType.json,
      followRedirects: true,
      receiveDataWhenStatusError: true,
    );
    super.onReady();
  }
}
