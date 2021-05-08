import 'dart:async';

import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/core/http_service.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/presentation/core/utils/date_utils.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenService extends GetxService {
  final StorageService storageService = Get.find();
  final HttpService httpService = Get.find();

  Rxn<DateTime> expirationDate = Rxn<DateTime>();
  RxString token = ''.obs;
  late Timer timerExpirationDate;

  List<Worker> workers = <Worker>[];

  Future<TokenService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onInit() {
    _initOnceWorkers();
    super.onInit();
  }

  @override
  void onReady() {
    token.value = getToken();
    expirationDate.value = _getExpirationDate();
    _initEverWorkers();
    super.onReady();
  }

  @override
  void onClose() {
    workers.forEach((Worker worker) => worker.dispose());
  }

  void saveToken(String? token) {
    storageService.box.write('token', token);
  }

  String getToken() {
    return storageService.box.read('token');
  }

  void clearToken() => storageService.box.remove('token');

  void clear() {
    clearToken();
    clearExpirationDate();
    if (timerExpirationDate.isActive) {
      timerExpirationDate.cancel();
    }
  }

  Map<String, dynamic> decodeToken() => JwtDecoder.decode(token.value!);

  void _saveExpirationDate(DateTime? date) {
    storageService.box.write(
      'expirationDate',
      date.toString(),
    );
  }

  void clearExpirationDate() => storageService.box.remove('expirationDate');

  DateTime? _getExpirationDate() {
    final String? date = storageService.box.read<String>('expirationDate');
    return date != null ? DateTime.parse(date) : null;
  }

  Future<void> _getRefreshToken() async {
    print("Refresh token...");
    try {
      final dio.Response<Map<String, dynamic>> response =
          await httpService.dio.post<Map<String, dynamic>>(
        DotEnv.env['BASE_URL']! + '/auth/refresh',
      );
      final AuthProfileTokenDto tokenDto = AuthProfileTokenDto.fromJson(
        response.data!,
      );
      token.value = tokenDto.accessToken;
      expirationDate.value = tokenDto.expirationTime.toLocal();
      print("Token refreshed...");
    } catch (e) {
      if (Get.currentRoute != Routes.signin) {
        Get.offAllNamed(Routes.signin);
      }
    }
  }

  void _initOnceWorkers() {
    workers.add(
      once(
        token,
        (String? token) {
          Future<void>.delayed(const Duration(seconds: 3), () {
            //clear();
            token == null
                ? Get.offAllNamed(Routes.signin)
                : Get.offAllNamed(Routes.home);
          });
        },
      ),
    );
    workers.add(
      once(
        expirationDate,
        (DateTime? expirationDate) {
          if (expirationDate != null) {
            _startTimerForRefreshToken();
          }
        },
      ),
    );
  }

  void _initEverWorkers() {
    workers.add(
      ever(
        token,
        (String? token) => saveToken(token),
      ),
    );
    workers.add(
      ever(
        expirationDate,
        (DateTime? date) => _processingOfRefreshToken(date),
      ),
    );
  }

  void _processingOfRefreshToken(DateTime? date) {
    _saveExpirationDate(date);
    _startTimerForRefreshToken();
  }

  void _startTimerForRefreshToken() {
    final int durationInSeconds = DateUtils.getDiffInSeconds(
      expirationDate.value!,
    );
    if (durationInSeconds < 0) {
      _getRefreshToken();
      return;
    }
    timerExpirationDate = Timer(
      Duration(seconds: durationInSeconds),
      _getRefreshToken,
    );
  }
}
