import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/application/student/activity/student_appointment_controller.dart';
import 'package:dashtech/application/student/activity/student_multiple_event_activity_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/planning/planning_repository.dart';
import 'package:get/get.dart';

class ActivityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IPlanningRepository>(() => PlanningRepository());
    Get.put<StudentActivityController>(StudentActivityController());
    Get.lazyPut<StudentMultipleEventActivityController>(
        () => StudentMultipleEventActivityController());
    Get.lazyPut<StudentAppointmentController>(() => StudentAppointmentController());
  }
}
