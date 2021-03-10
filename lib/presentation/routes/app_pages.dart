import 'package:dashtech/presentation/pages/activity/activity_details_page.dart';
import 'package:dashtech/presentation/pages/activity/bindings/activity_binding.dart';
import 'package:dashtech/presentation/pages/attendance/widgets/attendance_page.dart';
import 'package:dashtech/presentation/pages/auth/bindings/signin_binding.dart';
import 'package:dashtech/presentation/pages/auth/sign_in_page.dart';
import 'package:dashtech/presentation/pages/home/bindings/home_binding.dart';
import 'package:dashtech/presentation/pages/home/home_page.dart';
import 'package:dashtech/presentation/pages/splash/bindings/splash_binding.dart';
import 'package:dashtech/presentation/pages/splash/splash_page.dart';
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
      name: Routes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.activity_details,
      page: () => ActivityDetailsPage(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: Routes.attendance,
      page: () => AttendancePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
