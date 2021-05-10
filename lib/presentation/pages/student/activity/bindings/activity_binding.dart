import 'package:dashtech/application/student/activity/activity_controller.dart';
import 'package:dashtech/application/student/activity/appointment_controller.dart';
import 'package:dashtech/application/student/activity/multiple_event_activity_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/planning/planning_repository.dart';
import 'package:get/get.dart';

class ActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPlanningRepository>(
      () => PlanningRepository(
        graphqlService: Get.find(),
      ),
    );
    Get.put<ActivityController>(
      ActivityController(
        planningRepository: Get.find(),
      ),
    );
    Get.lazyPut<MultipleEventActivityController>(
      () => MultipleEventActivityController(
        planningRepository: Get.find(),
      ),
    );
    Get.lazyPut<AppointmentController>(
      () => AppointmentController(
        planningRepository: Get.find(),
      ),
    );
  }
}
