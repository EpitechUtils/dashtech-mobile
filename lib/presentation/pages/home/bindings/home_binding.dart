import 'package:dashtech/application/dashboard/activities_controller.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/application/home/home_controller.dart';
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
    Get.put<DashboardController>(DashboardController());
    Get.lazyPut<ActivitiesController>(
      () => ActivitiesController(
        planningRepository: Get.find(),
      ),
    );
  }
}
