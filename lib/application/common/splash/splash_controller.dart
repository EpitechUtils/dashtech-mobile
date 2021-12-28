import 'dart:io';

import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/service/firebase_service.dart';
import 'package:dashtech/presentation/core/utils/device_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class SplashController extends GetxController {
  final FirebaseService firebaseService = Get.find();
  final IAuthRepository authRepository = Get.find();

  final RxString version = ''.obs;
  final RxString build = ''.obs;
  final RxString flavor = ''.obs;

  @override
  void onReady() {
    sendNotificationToken();
    PackageInfo.fromPlatform().then((info) {
      version(info.version);
      build(info.buildNumber);
      flavor(dotenv.env['FLAVOR']);
    });
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
