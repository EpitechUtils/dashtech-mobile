import 'package:dashtech/application/shared/auth/signin_controller.dart';
import 'package:dashtech/application/shared/auth/signin_webview_controller.dart';
import 'package:get/get.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SigninController>(SigninController());
    Get.put<SigninWebviewController>(SigninWebviewController());
  }
}
