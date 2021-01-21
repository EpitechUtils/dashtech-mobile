import 'package:flutter_file_store/application/dashboard/dashboard_controller.dart';
import 'package:flutter_file_store/application/home/home_controller.dart';
import 'package:flutter_file_store/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:flutter_file_store/infrastructure/planning/planning_repository.dart';
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
    Get.put<DashboardController>(DashboardController(
      planningRepository: Get.find(),
    ));
  }
}
