import 'package:dashtech/application/auth/signin_webview_controller.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/pages/auth/widgets/sign_in_intranet_syncing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

class SingInIntranetWebview extends GetView<SigninWebviewController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.close, size: 30, color: Color(0xFF131313)),
                ),
                Text(
                  'intranet_signin'.tr,
                  style: TextStyle(
                    color: Color(0xFF131313),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => controller.progress.value < 1.0
                ? LinearProgressIndicator(value: controller.progress.value)
                : Container(),
          ),
          Expanded(
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
                          preferredContentMode:
                              UserPreferredContentMode.MOBILE),
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
          )
        ],
      ),
    );
  }
}
