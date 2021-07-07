import 'package:dashtech/domain/auth/enum/intranet_rights.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/infrastructure/core/service/token_service.dart';
import 'package:dashtech/presentation/pages/admin/attendance/bindings/admin_attendance_bindings.dart';
import 'package:dashtech/presentation/pages/admin/card/bindings/admin_card_bindings.dart';
import 'package:dashtech/presentation/pages/admin/dashboard/bindings/admin_dashboard_bindings.dart';
import 'package:dashtech/presentation/pages/admin/home/bindings/admin_home_bindings.dart';
import 'package:dashtech/presentation/pages/student/dashboard/bindings/student_dsahboard_bindings.dart';
import 'package:dashtech/presentation/pages/student/home/bindings/student_home_bindings.dart';
import 'package:dashtech/presentation/pages/student/planning/bindings/student_planning_bindings.dart';
import 'package:dashtech/presentation/pages/student/profile/bindings/student_profile_bindings.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/widgets.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:get/get.dart';

class RightsMiddleware extends GetMiddleware {
  final TokenService tokenService = Get.find();
  final StorageService storageService = Get.find();

  @override
  int get priority => 1;

  /// Check if user can manage attendances
  bool isIntranetAdmin() {
    final decodedToken = tokenService.decodeToken();
    if (decodedToken['rights'] == null) return false;
    bool authorize = false;

    List<String>.from(decodedToken['rights']).forEach((e) {
      if (EnumToString.convertToString(IntranetRight.global) != e) {
        authorize = true;
      }
    });

    return authorize;
  }

  @override
  RouteSettings? redirect(String? route) {
    return isIntranetAdmin() ? null : RouteSettings(name: Routes.signin);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    if (bindings == null) return bindings;

    if (this.isIntranetAdmin()) {
      bindings.add(AdminHomeBindings());
      bindings.add(AdminDashboardBindings());
      bindings.add(AdminAttendanceBindings());
      bindings.add(AdminCardBindings());
    } else {
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
