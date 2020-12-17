import 'package:flutter_file_store/presentation/pages/auth/forgot/forgot_page.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_in/bindings/signin_binding.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_in/sign_in_page.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_up/bindings/sign_up_binding.dart';
import 'package:flutter_file_store/presentation/pages/auth/sign_up/sign_up_page.dart';
import 'package:flutter_file_store/presentation/pages/home/home_page.dart';
import 'package:flutter_file_store/presentation/pages/splash/bindings/splash_binding.dart';
import 'package:flutter_file_store/presentation/pages/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const String initial = Routes.splash;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.signin,
      page: () => SigninPage(),
      binding: SigninBinding(),
      transition: Get.previousRoute == Routes.splash
          ? Transition.rightToLeft
          : Transition.leftToRight,
    ),
    GetPage(
      name: Routes.signup,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.forgot,
      page: () => ForgotPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
  ];
}
