import 'dart:async';

import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/presentation/core/utils/date_utils.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenService extends GetxService {
  final StorageService storageService = Get.find();

  Rx<DateTime> expirationDate = Rx<DateTime>();
  RxString token = RxString();

  Worker tokenWorker;
  Worker expirationWorker;

  Future<TokenService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() {
    token.value = getToken();
    expirationDate.value = _getExpirationDate();
    _initWorkers();
    super.onReady();
  }

  @override
  void onClose() {
    tokenWorker.dispose();
    expirationWorker.dispose();
  }

  void saveToken(String token) {
    storageService.box.write('token', token);
    print('Token has been saved...');
  }

  String getToken() => storageService.box.read('token');

  void clearToken() => storageService.box.remove('token');

  Map<String, dynamic> decodeToken() => JwtDecoder.decode(token.value);

  void _saveExpirationDate(DateTime date) {
    storageService.box.write(
      'expirationDate',
      date.toString(),
    );
  }

  DateTime _getExpirationDate() {
    final String date = storageService.box.read<String>('expirationDate');
    return !date.isNullOrBlank ? DateTime.parse(date) : null;
  }

  Future<void> _getRefreshToken() async {
    print("Refresh token...");
    /*final response = await httpService.dio.post<Map<String, dynamic>>(
      '/auth/refresh',
    );
    final AuthProfileDto authProfileDto = AuthProfileDto.fromJson(
      response.data,
    );
    token.value = authProfileDto.accessToken;
    expirationDate.value = authProfileDto.expirationTime.toLocal();*/
    print("Token now refreshed...");
  }

  void _initWorkers() {
    tokenWorker = ever(
      token,
      (String token) => _processingOfNew(token),
    );
    expirationWorker = ever(
      expirationDate,
      (DateTime date) => _saveExpirationDate(date),
    );
  }

  void _processingOfNew(String token) {
    saveToken(token);
    _startTimerForRefreshToken();
  }

  void _startTimerForRefreshToken() {
    final int durationInSeconds = DateUtils.getDiffInSeconds(
      expirationDate.value,
    );
    Timer(
      Duration(seconds: durationInSeconds),
      _getRefreshToken,
    );
  }
}
