import 'package:dashtech/application/common/onboarding/onboarding_controller.dart';
import 'package:dashtech/application/common/onboarding/onboarding_webview_controller.dart';
import 'package:get/get.dart';

class OnboardingBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<OnboardingWebviewController>(
        () => OnboardingWebviewController());
  }
}
