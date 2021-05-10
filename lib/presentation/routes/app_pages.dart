import 'package:dashtech/infrastructure/core/intranet_rights_service.dart';
import 'package:dashtech/presentation/pages/admin/dashboard/bindings/admin_dashbpard_bindings.dart';
import 'package:dashtech/presentation/pages/admin/home/bindings/admin_home_bindings.dart';
import 'package:dashtech/presentation/pages/shared/auth/bindings/signin_binding.dart';
import 'package:dashtech/presentation/pages/shared/auth/sign_in_page.dart';
import 'package:dashtech/presentation/pages/shared/home/bindings/home_binding.dart';
import 'package:dashtech/presentation/pages/shared/home/home_page.dart';
import 'package:dashtech/presentation/pages/shared/settings/bindings/settings_bindings.dart';
import 'package:dashtech/presentation/pages/shared/splash/bindings/splash_binding.dart';
import 'package:dashtech/presentation/pages/shared/splash/splash_page.dart';
import 'package:dashtech/presentation/pages/student/activity/bindings/activity_binding.dart';
import 'package:dashtech/presentation/pages/student/activity/student_activity_details_page.dart';
import 'package:dashtech/presentation/pages/student/attendance/widgets/attendance_page.dart';
import 'package:dashtech/presentation/pages/student/dashboard/bindings/student_dsahboard_bindings.dart';
import 'package:dashtech/presentation/pages/student/home/bindings/student_home_bindings.dart';
import 'package:dashtech/presentation/pages/student/planning/bindings/student_planning_bindings.dart';
import 'package:dashtech/presentation/pages/student/profile/bindings/student_profile_bindings.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const String initial = Routes.splash;
  static final IntranetRightsService intranetRightsService = Get.find();

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
      bindings: intranetRightsService.canManageAttendances()
          ? <Bindings>[
              HomeBinding(),
              AdminHomeBindings(),
              AdminDashboardBindings(),
              SettingsBindings(),
            ]
          : <Bindings>[
              HomeBinding(),
              StudentHomeBindings(),
              StudentDashboardBindings(),
              StudentPlanningBindings(),
              StudentProfileBindings(),
              SettingsBindings(),
            ],
    ),
    GetPage(
      name: Routes.activity_details,
      page: () => StudentActivityDetailsPage(),
      binding: ActivityBinding(),
    ),
    GetPage(
      name: Routes.attendance,
      page: () => AttendancePage(),
      transition: Transition.fadeIn,
    ),
  ];
}
