import 'dart:async';

import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:get/get.dart';

class FirebaseService extends GetxService {
  final StorageService storageService = Get.find();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  late StreamSubscription iosSubscription;

  Future<FirebaseService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  Future<void> onReady() async {
    await _initFirebaseMessaging();
    super.onReady();
  }

  @override
  void onClose() {
    iosSubscription.cancel();
  }

  Future<void> _initFirebaseMessaging() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    Get.log('User granted permission: ${settings.authorizationStatus}');

    /*FirebaseMessaging.onBackgroundMessage((message) async {
      SnackBarUtils.info(message: message.toString());
    });*/

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Get.log('Got a message whilst in the foreground!');
      Get.log('Message data: ${message.data}');

      if (message.notification != null) {
        Get.log('Message also contained a notif: ${message.notification}');
      }

      SnackBarUtils.info(message: message.toString());
    });

    await saveDeviceToken();
  }

  Future<void> saveDeviceToken() async {
    final String? token =
        await messaging.getToken(vapidKey: DotEnv.env['FCM_VAPID_KEY']);
    if (token != null && token.isNotEmpty) {
      storageService.box.write('deviceToken', token);
      Get.log('Device token has been saved...');
    }
  }

  String getToken() => storageService.box.read('deviceToken');
}
