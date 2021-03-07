import 'dart:async';
import 'dart:io';

import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final StorageService storageService = Get.find();

  final FirebaseMessaging fm = FirebaseMessaging();
  StreamSubscription iosSubscription;

  Future<FirebaseService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onReady() {
    _initFirebaseMessaging();
    super.onReady();
  }

  @override
  void onClose() {
    iosSubscription.cancel();
  }

  void _initFirebaseMessaging() {
    fm.configure(
      onMessage: (Map<String, dynamic> message) async {
        SnackBarUtils.info(message: message.toString());
      },
    );

    if (Platform.isIOS) {
      iosSubscription = fm.onIosSettingsRegistered.listen((event) {
        saveDeviceToken();
      });
      fm.requestNotificationPermissions(IosNotificationSettings());
      return;
    }

    saveDeviceToken();
  }

  void saveDeviceToken() async {
    final String token = await fm.getToken();
    if (token != null && token.isNotEmpty) {
      storageService.box.write('deviceToken', token);
      print('Device token has been saved...');
    }
  }

  String getToken() => storageService.box.read('deviceToken');
}
