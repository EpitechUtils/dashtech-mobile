import 'dart:io';

import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/service/firebase_service.dart';
import 'package:dashtech/presentation/core/utils/device_utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  final FirebaseService firebaseService = Get.find();
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
