import 'package:dashtech/application/dashboard/activities_controller.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/application/home/home_controller.dart';
import 'package:dashtech/application/planning/planning_controller.dart';
import 'package:dashtech/application/settings/settings_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/planning/planning_repository.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPlanningRepository>(
      () => PlanningRepository(
        graphqlService: Get.find(),
      ),
    );
    Get.put<HomeController>(HomeController());
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
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}
