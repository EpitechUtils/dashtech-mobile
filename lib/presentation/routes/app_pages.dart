import 'package:dashtech/infrastructure/core/middleware/auth_middleware.dart';
import 'package:dashtech/infrastructure/core/middleware/intra_admin_middleware.dart';
import 'package:dashtech/presentation/pages/admin/attendance/bindings/admin_attendance_bindings.dart';
import 'package:dashtech/presentation/pages/admin/card/bindings/admin_card_bindings.dart';
import 'package:dashtech/presentation/pages/admin/dashboard/bindings/admin_dashboard_bindings.dart';
import 'package:dashtech/presentation/pages/admin/home/admin_home_page.dart';
import 'package:dashtech/presentation/pages/admin/home/bindings/admin_home_bindings.dart';
import 'package:dashtech/presentation/pages/common/auth/bindings/signin_binding.dart';
import 'package:dashtech/presentation/pages/common/auth/sign_in_intranet_webview_page.dart';
import 'package:dashtech/presentation/pages/common/auth/sign_in_page.dart';
import 'package:dashtech/presentation/pages/common/home/bindings/home_binding.dart';
import 'package:dashtech/presentation/pages/common/onboarding/bindings/onboarding_bindings.dart';
import 'package:dashtech/presentation/pages/common/onboarding/onboarding_import_page.dart';
import 'package:dashtech/presentation/pages/common/onboarding/onboarding_link_page.dart';
import 'package:dashtech/presentation/pages/common/onboarding/onboarding_page.dart';
import 'package:dashtech/presentation/pages/common/settings/bindings/settings_bindings.dart';
import 'package:dashtech/presentation/pages/common/splash/bindings/splash_binding.dart';
import 'package:dashtech/presentation/pages/common/splash/splash_page.dart';
import 'package:dashtech/presentation/pages/student/activity_details/bindings/activity_binding.dart';
import 'package:dashtech/presentation/pages/student/activity_details/student_activity_details_page.dart';
import 'package:dashtech/presentation/pages/student/attendance/widgets/attendance_page.dart';
import 'package:dashtech/presentation/pages/student/dashboard/bindings/student_dsahboard_bindings.dart';
import 'package:dashtech/presentation/pages/student/home/bindings/student_home_bindings.dart';
import 'package:dashtech/presentation/pages/student/home/student_home_page.dart';
import 'package:dashtech/presentation/pages/student/planning/bindings/student_planning_bindings.dart';
import 'package:dashtech/presentation/pages/student/profile/bindings/student_profile_bindings.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const String initial = Routes.splash;

  static final List<GetPage> studentRoutes = [
    GetPage(
      name: Routes.student,
      page: () => StudentHomePage(),
      bindings: [
        HomeBinding(),
        SettingsBindings(),
        StudentHomeBindings(),
        StudentDashboardBindings(),
        StudentPlanningBindings(),
        StudentProfileBindings(),
      ],
      middlewares: [
        AuthMiddleware(),
      ],
    ),
    GetPage(
      name: Routes.activityDetails,
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

  static final List<GetPage> adminRoutes = [
    GetPage(
      name: Routes.admin,
      page: () => AdminHomePage(),
      bindings: [
        HomeBinding(),
        SettingsBindings(),
        AdminHomeBindings(),
        AdminDashboardBindings(),
        AdminAttendanceBindings(),
        AdminCardBindings(),
      ],
      middlewares: [
        AuthMiddleware(),
        IntraAdminMiddleware(),
      ],
    ),
  ];

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingBindings(),
    ),
    GetPage(
      name: Routes.onboardingImport,
      page: () => OnboardingImportPage(),
      binding: OnboardingBindings(),
    ),
    GetPage(
      name: Routes.onboardingLink,
      page: () => OnboardingLinkPage(),
      binding: OnboardingBindings(),
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
      name: Routes.signinWebview,
      page: () => SignInIntranetWebviewPage(),
      binding: SigninBinding(),
    ),
    ...studentRoutes,
    ...adminRoutes,
  ];
}
