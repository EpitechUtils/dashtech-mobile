import 'package:dashtech/application/shared/home/home_controller.dart';
import 'package:dashtech/application/shared/settings/settings_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/intranet_rights_service.dart';
import 'package:dashtech/infrastructure/planning/planning_repository.dart';
import 'package:dashtech/infrastructure/profile/profile_repository.dart';
import 'package:dashtech/presentation/pages/admin/home/bindings/admin_home_bindings.dart';
import 'package:dashtech/presentation/pages/student/home/bindings/student_home_bindings.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  final IntranetRightsService intranetRightsService = Get.find();

  @override
  void dependencies() {
    Get.lazyPut<IPlanningRepository>(() => PlanningRepository());
    Get.put<HomeController>(HomeController());
    Get.lazyPut<IProfileRepository>(() => ProfileRepository());
    Get.lazyPut<SettingsController>(() => SettingsController());

    Bindings loader = intranetRightsService.canManageAttendances()
        ? AdminHomeBindings()
        : StudentHomeBindings();
    loader.dependencies();
  }
}
