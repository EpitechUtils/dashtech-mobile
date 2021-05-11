import 'package:dashtech/application/admin/attendance/admin_attendance_controller.dart';
import 'package:get/get.dart';

class AdminAttendanceBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminAttendanceController>(() => AdminAttendanceController());
  }
}
