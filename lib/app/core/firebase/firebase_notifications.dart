import 'dart:async';
import 'dart:io';

import 'package:basic_utils/basic_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_event.dart';
import 'package:epitech_intranet_mobile/injection.dart';

class FirebaseNotifications {
  static GlobalKey<ScaffoldState> appGlobalKey;

  FirebaseNotifications._privateConstructor();
  static final FirebaseNotifications _instance = FirebaseNotifications._privateConstructor();
  factory FirebaseNotifications() => _instance;

  final FirebaseMessaging _fcm = FirebaseMessaging();
  StreamSubscription _iosSubscription;

  /// Listen for notifications from firebase cloud messaging
  /// Warning; Don't forget to unsubscribe to all channels
  void listen() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async => print(message),
      onResume: (Map<String, dynamic> message) async => print(message),
    );

    if (Platform.isIOS) {
      _iosSubscription = _fcm.onIosSettingsRegistered.listen((data) {
        _saveDeviceToken();
      });
      _fcm.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true),
      );
    }
    _saveDeviceToken();
  }

  /// Save device token
  Future<void> _saveDeviceToken() async {
    final String deviceToken = await _fcm.getToken();
    if (StringUtils.isNotNullOrEmpty(deviceToken)) {
      getIt<ProfileBloc>().add(
        ProfileEvent.registerNewDevice(token: deviceToken),
      );
    }
  }

  /// Dispose and unsubscribe ios settings registration
  void dispose() {
    if (_iosSubscription != null) {
      _iosSubscription.cancel();
    }
  }

  /// Regenerate the global key of the application
  GlobalKey<ScaffoldState> globalKey({bool generate = false}) {
    if (generate || appGlobalKey == null)
      appGlobalKey = new GlobalKey<ScaffoldState>(debugLabel: "epitech_intranet_mobileGlobalKey");

    // Return the key
    return appGlobalKey;
  }
}
