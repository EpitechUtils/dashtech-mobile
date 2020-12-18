import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_file_store/infrastructure/core/http_service.dart';
import 'package:flutter_file_store/infrastructure/core/storage_service.dart';
import "package:flutter/material.dart";
import 'package:flutter_file_store/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import "package:get/get.dart";
import "package:get/state_manager.dart";

class SigninWebviewController extends GetxController {
  final StorageService storageService = Get.find();
  final HttpService httpService = Get.find();

  SigninWebviewController({@required this.authRepository});

  final IAuthRepository authRepository;

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
    dio.Response resp = await httpService.dio
        .get("https://intra.epitech.eu/admin/autolog?format=json");

    dynamic body = resp.data;
    if (body == null ||
        resp.statusCode >= 500 ||
        resp.data['office_auth_uri'] == null) {
      return null;
    }

    officeLoginUrl.value = body['office_auth_uri'];
  }

  // When progress load of the page change
  void onProgressChanged(InAppWebViewController controller, int val) {
    progress.value = val / 100;
  }

  // When url stop to load
  void onLoadStop(InAppWebViewController controller, String url) {
    if (url.startsWith("https://intra.epitech.eu/admin/autolog")) {
      //Navigator.of(Get.context).pop();

      try {
        controller
            .evaluateJavascript(source: "document.documentElement.innerHTML")
            .then((body) {
          if (Platform.isIOS) {
            // Remove html tags from response
            RegExp exp =
                RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
            return body.replaceAll(exp, '');
          } else {
            String autologin = body.substring(body.indexOf("autologin"));
            String autolog_url =
                autologin.substring(autologin.indexOf(":") + 1);
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
  void performSync(String autoLog) {
    isSyncing.value = true;
  }
}
