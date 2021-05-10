import 'package:dashtech/application/shared/home/home_controller.dart';
import 'package:dashtech/application/shared/settings/settings_controller.dart';
import 'package:dashtech/application/student/dashboard/activities_controller.dart';
import 'package:dashtech/application/student/dashboard/dashboard_controller.dart';
import 'package:dashtech/application/student/planning/planning_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/infrastructure/planning/planning_repository.dart';
import 'package:dashtech/infrastructure/profile/profile_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPlanningRepository>(
      () => PlanningRepository(
        graphqlService: Get.find(),
      ),
    );
    Get.put<HomeController>(HomeController(
      intranetRightsService: Get.find(),
    ));
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        storageService: Get.find(),
      ),
    );
    Get.lazyPut<ActivitiesController>(
      () => ActivitiesController(
        planningRepository: Get.find(),
      ),
    );

    // Planning
    Get.lazyPut<PlanningController>(
      () => PlanningController(
        planningRepository: Get.find(),
      ),
    );

    // Settings
    Get.lazyPut<IProfileRepository>(
      () => ProfileRepository(
        graphqlService: Get.find(),
        storageService: Get.find(),
      ),
    );
    Get.lazyPut<SettingsController>(
      () => SettingsController(
        profileRepository: Get.find(),
      ),
    );
  }
}
