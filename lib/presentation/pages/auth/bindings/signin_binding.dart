import 'package:flutter_file_store/application/auth/signin_controller.dart';
import 'package:flutter_file_store/application/auth/signin_webview_controller.dart';
import 'package:get/get.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SigninController>(
      SigninController(authRepository: Get.find()),
    );
    Get.put<SigninWebviewController>(
      SigninWebviewController(
        authRepository: Get.find(),
      ),
    );
  }
}
