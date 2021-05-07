import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

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
    dio = Dio(
      BaseOptions(
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
      ),
    );
    super.onReady();
  }
}
