import 'package:flutter_file_store/application/auth/signup_controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignupController>(
      SignupController(authRepository: Get.find()),
    );
  }
}
