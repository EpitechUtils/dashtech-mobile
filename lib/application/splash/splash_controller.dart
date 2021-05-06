import 'dart:io';

import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/firebase_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/core/utils/device_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashController extends GetxController {
  SplashController({
    required this.firebaseService,
  });

  final FirebaseService firebaseService;
  final IAuthRepository authRepository = Get.find();

  @override
  void onReady() {
    sendNotificationToken();
    super.onReady();
  }

  // Send the notification token to API
  Future<void> sendNotificationToken() async {
    final String? deviceToken = this.firebaseService.getToken();
    if (deviceToken != null && deviceToken.isNotEmpty) {
      final Map<String, String?> info = await DeviceUtils.getDeviceDetails();
      await authRepository.sendDeviceToken(
        deviceToken,
        info['identifier']!,
        Platform.operatingSystem,
      );
    }
  }
}
