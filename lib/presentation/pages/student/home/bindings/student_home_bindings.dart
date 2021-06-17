import 'package:dashtech/application/student/dashboard/student_activities_controller.dart';
import 'package:dashtech/application/student/dashboard/student_dashboard_controller.dart';
import 'package:dashtech/application/student/planning/student_planning_controller.dart';
import 'package:get/get.dart';

class StudentHomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentDashboardController>(() => StudentDashboardController());
    Get.lazyPut<StudentActivitiesController>(() => StudentActivitiesController());
    Get.lazyPut<StudentPlanningController>(() => StudentPlanningController());
  }
}
