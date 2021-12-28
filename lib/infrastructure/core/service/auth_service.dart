import 'dart:async';

import 'package:dashtech/domain/auth/enum/intranet_rights.dart';
import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/infrastructure/core/provider/auth_provider.connect.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/presentation/core/utils/date_utils.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthService extends GetxService {
  final StorageService storageService = Get.find();
  final AuthProvider authProvider = Get.find();

  final Rxn<DateTime> expirationDate = Rxn<DateTime>();
  final RxnString token = RxnString(null);
  late Timer timerExpirationDate;

  final List<Worker> workers = <Worker>[];

  Future<AuthService> init() async {
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

  void saveToken(String? token) => storageService.box.write('token', token);

  String? getToken() => storageService.box.read('token');

  bool isIntranetAdmin() {
    final decodedToken = this.decodeToken();
    if (decodedToken['rights'] == null) return false;
    bool authorize = false;

    List<String>.from(decodedToken['rights']).forEach((e) {
      if (EnumToString.convertToString(IntranetRight.global) != e) {
        authorize = true;
      }
    });

    return authorize;
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
    Logger.write("Refresh token...");
    AuthProfileTokenDto? tokenDto = await authProvider.refresh();
    if (tokenDto == null) {
      if (Get.currentRoute != Routes.signin) {
        Get.offAllNamed(Routes.signin);
      }
      return;
    }

    Logger.write("Token refreshed...");
    token.value = tokenDto.accessToken;
    expirationDate.value = tokenDto.expirationTime.toLocal();
  }

  void _initOnceWorkers() {
    workers.add(
      once(
        token,
        (String? token) {
          Future<void>.delayed(const Duration(seconds: 5), () {
            //clear();

            if (token == null) {
              Get.offAllNamed(Routes.onboarding);
              return;
            }

            this.isIntranetAdmin()
                ? Get.offAllNamed(Routes.admin)
                : Get.offAllNamed(Routes.student);
          });
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
    print("refresh");
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
