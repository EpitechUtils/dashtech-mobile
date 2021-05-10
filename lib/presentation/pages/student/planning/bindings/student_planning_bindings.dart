import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/planning/planning_repository.dart';
import 'package:get/get.dart';

class StudentPlanningBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPlanningRepository>(() => PlanningRepository());
  }
}
