import 'package:dashtech/application/common/auth/signin_webview_controller.dart';
import 'package:dashtech/presentation/common/auth_layout_copy.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/pages/common/auth/widgets/sign_in_intranet_syncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class SignInIntranetWebviewPage extends GetView<SigninWebviewController> {
  @override
  Widget build(BuildContext context) {
    return AuthLayoutCopy(
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
            replacement: SingInIntranetSyncing(),
          );
        },
      ),
    );
  }
}
