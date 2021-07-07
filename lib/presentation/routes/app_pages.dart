import 'package:dashtech/infrastructure/core/middleware/auth_middleware.dart';
import 'package:dashtech/infrastructure/core/middleware/rigths_middleware.dart';
import 'package:dashtech/presentation/pages/shared/auth/bindings/signin_binding.dart';
import 'package:dashtech/presentation/pages/shared/auth/sign_in_page.dart';
import 'package:dashtech/presentation/pages/shared/home/bindings/home_binding.dart';
import 'package:dashtech/presentation/pages/shared/settings/bindings/settings_bindings.dart';
import 'package:dashtech/presentation/pages/shared/splash/bindings/splash_binding.dart';
import 'package:dashtech/presentation/pages/shared/splash/splash_page.dart';
import 'package:dashtech/presentation/pages/student/activity/bindings/activity_binding.dart';
import 'package:dashtech/presentation/pages/student/activity/student_activity_details_page.dart';
import 'package:dashtech/presentation/pages/student/attendance/widgets/attendance_page.dart';
import 'package:flutter/widgets.dart';
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
      transition:
          Get.previousRoute == Routes.splash ? Transition.rightToLeft : Transition.leftToRight,
    ),
    GetPage(
      name: Routes.home,
      page: () => Container(),
      bindings: <Bindings>[
        HomeBinding(),
        SettingsBindings(),
      ],
      middlewares: [
        AuthMiddleware(),
        RightsMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.activity_details,
      page: () => StudentActivityDetailsPage(),
      binding: ActivityBinding(),
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.attendance,
      page: () => AttendancePage(),
      transition: Transition.fadeIn,
      middlewares: [
        AuthMiddleware(),
      ],
    ),
  ];
}
