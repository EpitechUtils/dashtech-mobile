import 'package:dashtech/application/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(
      tokenService: Get.find(),
      firebaseService: Get.find(),
    ));
  }
}
