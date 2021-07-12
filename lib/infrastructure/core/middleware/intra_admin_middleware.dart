import 'package:dashtech/infrastructure/core/service/auth_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/pages/admin/attendance/bindings/admin_attendance_bindings.dart';
import 'package:dashtech/presentation/pages/admin/card/bindings/admin_card_bindings.dart';
import 'package:dashtech/presentation/pages/admin/dashboard/bindings/admin_dashboard_bindings.dart';
import 'package:dashtech/presentation/pages/admin/home/bindings/admin_home_bindings.dart';
import 'package:dashtech/presentation/pages/common/home/bindings/home_binding.dart';
import 'package:dashtech/presentation/pages/common/settings/bindings/settings_bindings.dart';
import 'package:dashtech/presentation/pages/student/dashboard/bindings/student_dsahboard_bindings.dart';
import 'package:dashtech/presentation/pages/student/home/bindings/student_home_bindings.dart';
import 'package:dashtech/presentation/pages/student/planning/bindings/student_planning_bindings.dart';
import 'package:dashtech/presentation/pages/student/profile/bindings/student_profile_bindings.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntraAdminMiddleware extends GetMiddleware {
  final AuthService authService = Get.find();
  final StorageService storageService = Get.find();

  @override
  int get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    return authService.isIntranetAdmin() ? null : RouteSettings(name: Routes.signin);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    if (bindings == null) bindings = [];

    bindings.add(HomeBinding());
    bindings.add(SettingsBindings());

    if (authService.isIntranetAdmin()) {
      Logger.write("Applying bindings for admin");
      bindings.add(AdminHomeBindings());
      bindings.add(AdminDashboardBindings());
      bindings.add(AdminAttendanceBindings());
      bindings.add(AdminCardBindings());
    } else {
      Logger.write("Applying bindings for student");
      bindings.add(StudentHomeBindings());
      bindings.add(StudentDashboardBindings());
      bindings.add(StudentPlanningBindings());
      bindings.add(StudentProfileBindings());
    }

    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Logger.write("$runtimeType bindings ready");
    return page;
  }
}
