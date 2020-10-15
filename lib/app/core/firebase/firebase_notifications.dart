import 'dart:async';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  FirebaseNotifications._privateConstructor();
  static final FirebaseNotifications _instance = FirebaseNotifications._privateConstructor();
  factory FirebaseNotifications() => _instance;

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription _iosSubscription;

  /// Listen for notifications from firebase cloud messaging
  void listen(String deviceUuid) {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        ToastUtils.info(message.toString());
      },
    );

    if (Platform.isIOS) {
      _iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken(deviceUuid);
      });
      _fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true),
      );
      return;
    }
    _saveDeviceToken(deviceUuid);
  }

  /// Save device token
  Future<void> _saveDeviceToken(String deviceUuid) async {
    final String deviceToken = await _fcm.getToken();
    if (StringUtils.isNotNullOrEmpty(deviceToken)) {
      getIt<AuthBloc>().add(
        AuthEvent.registerNewDevice(deviceUuid: deviceUuid, token: deviceToken),
      );
    }
  }

  /// Dispose and unsubscribe ios settings registration
  void dispose() {
    if (_iosSubscription != null) {
      _iosSubscription.cancel();
    }
  }
}
