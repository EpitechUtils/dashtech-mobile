import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/auth/failures/auth_failure.dart';
import 'package:dashtech/domain/auth/models/auth_profile.dart';
import 'package:dashtech/infrastructure/core/service/http_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import "package:get/get.dart";
import "package:get/state_manager.dart";

class SigninWebviewController extends GetxController {
  final StorageService storageService = Get.find();
  final HttpService httpService = Get.find();
  final IAuthRepository authRepository = Get.find();

  final RxBool isSyncing = false.obs;
  final RxDouble progress = 0.0.obs;
  final RxString officeLoginUrl = ''.obs;

  @override
  void onInit() {
    _getOfficeLoginUrl();

    super.onInit();
  }

  // Get office url from intranet
  void _getOfficeLoginUrl() async {
    final resp = await httpService.connect.get("/admin/autolog?format=json");

    dynamic body = resp.body;
    print(body);
    if (body == null || resp.statusCode! >= 500 || resp.body['office_auth_uri'] == null) {
      return null;
    }

    officeLoginUrl.value = body['office_auth_uri'];
  }

  // When progress load of the page change
  void onProgressChanged(InAppWebViewController controller, int val) {
    progress.value = val / 100;
  }

  // When url stop to load
  void onLoadStop(InAppWebViewController controller, Uri? uri) {
    if (uri.toString().startsWith("https://intra.epitech.eu/admin/autolog")) {
      //Navigator.of(Get.context).pop();

      try {
        controller.evaluateJavascript(source: "document.documentElement.innerHTML").then((body) {
          if (Platform.isIOS) {
            // Remove html tags from response
            RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
            return body.replaceAll(exp, '');
          } else {
            String autologin = body.substring(body.indexOf("autologin"));
            String autolog_url = autologin.substring(autologin.indexOf(":") + 1);
            autolog_url = autolog_url.substring(1, autolog_url.indexOf("\\n}"));
            autolog_url = autolog_url.replaceAll("\\", "");
            return autolog_url.substring(1, autolog_url.length - 1);
          }
        }).then((autologJson) {
          Map<String, dynamic> result;
          if (Platform.isIOS)
            result = json.decode(autologJson);
          else
            result = {"autologin": autologJson};

          // Check if autolog exists
          if (result["autologin"] == null) {
            SnackBarUtils.error(message: 'http_profile_login_fail');
            return;
          } // (E9&T^\;

          performSync(result["autologin"]);
        });
      } catch (err) {
        SnackBarUtils.error(message: 'http_common');
      }
    }
  }

  // Perform intra and account checks and synchronization
  // TODO: Caching some basic data from intra
  void performSync(String autoLog) async {
    isSyncing.value = true;
    final String profileId = storageService.box.read('profileId');

    final failureOrYes = await authRepository.setProfileAutolog(profileId, autoLog);
    failureOrYes.fold(
      (left) => left.map(
        unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
        notFound: (_) => SnackBarUtils.error(message: 'http_profile_not_found'),
        conflict: (_) => SnackBarUtils.error(message: 'http_profile_email_missmatch'),
        unauthorized: (_) => SnackBarUtils.error(message: 'http_common'),
      ),
      (right) {
        Get.back();
        performLoginFromCurrentProfileId(profileId);
      },
    );
  }

  // Login from current profile id
  void performLoginFromCurrentProfileId(String profileId) async {
    final String profileEmail = storageService.box.read('profileEmail');
    final failureOrYes = await authRepository.login(profileId, profileEmail);

    failureOrYes.fold(
      (left) => left.map(
        unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
        notFound: (_) => SnackBarUtils.error(message: 'http_profile_not_found'),
        conflict: (_) => SnackBarUtils.error(message: 'http_profile_email_missmatch'),
        unauthorized: (_) => SnackBarUtils.error(message: 'http_common'),
      ),
      (right) => Get.toNamed(Routes.home),
    );
  }
}
