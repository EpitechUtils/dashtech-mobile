import 'package:dashtech/application/student/dashboard/student_dashboard_controller.dart';
import 'package:get/get.dart';

class StudentDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentDashboardController>(StudentDashboardController());
  }
}
