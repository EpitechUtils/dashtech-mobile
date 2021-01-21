import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/infrastructure/auth/auth_repository.dart';
import 'package:dashtech/infrastructure/core/firebase_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/core/utils/device_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashController extends GetxController {
  SplashController({
    @required this.tokenService,
    @required this.firebaseService,
  });

  final TokenService tokenService;
  final FirebaseService firebaseService;
  final IAuthRepository authRepository = Get.find();

  @override
  void onReady() {
    checkToken();
    sendNotificationToken();
    super.onReady();
  }

  // Check the validity of the token
  Future<void> checkToken() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 3000),
      () {
        final String token = tokenService.getToken();
        //tokenService.clearToken();
        final bool tokenIsInvalid = JwtDecoder.isExpired(token);
        token.isNullOrBlank || tokenIsInvalid
            ? Get.offAllNamed(Routes.signin)
            : Get.offAllNamed(Routes.home);
      },
    );
  }

  // Send the notification token to API
  Future<void> sendNotificationToken() async {
    final String deviceToken = this.firebaseService.getToken();
    if (deviceToken != null && deviceToken.isNotEmpty) {
      final Map<String, String> info = await DeviceUtils.getDeviceDetails();
      await authRepository.sendDeviceToken(
        deviceToken,
        info['identifier'],
        Platform.operatingSystem,
      );
    }
  }
}
