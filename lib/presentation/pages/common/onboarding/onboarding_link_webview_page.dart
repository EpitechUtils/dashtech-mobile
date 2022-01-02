import 'package:dashtech/application/common/onboarding/onboarding_webview_controller.dart';
import 'package:dashtech/presentation/common/layouts/base_layout.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class OnboardingLinkWebviewPage extends GetView<OnboardingWebviewController> {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      title: "Connexion vers Epitech",
      child: Obx(
        () {
          if (controller.officeLoginUrl.value.isEmpty) {
            SnackBarUtils.error(message: 'error_occured');
            return Container();
          }

          return Visibility(
            visible: !controller.isSyncing.value,
            child: InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
                android: AndroidInAppWebViewOptions(
                  useHybridComposition: true,
                ),
                ios: IOSInAppWebViewOptions(
                  allowsInlineMediaPlayback: true,
                ),
                crossPlatform: InAppWebViewOptions(
                  cacheEnabled: false,
                  clearCache: true,
                  javaScriptEnabled: true,
                  preferredContentMode: UserPreferredContentMode.MOBILE,
                ),
              ),
              initialUrlRequest: URLRequest(
                url: Uri.parse(controller.officeLoginUrl.value),
              ),
              onProgressChanged: controller.onProgressChanged,
              onLoadStop: controller.onLoadStop,
            ),
          );
        },
      ),
    );
  }
}
