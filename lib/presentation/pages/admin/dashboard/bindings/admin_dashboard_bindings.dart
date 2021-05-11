import 'package:dashtech/application/admin/dashboard/admin_dashboard_controller.dart';
import 'package:get/get.dart';

class AdminDashboardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDashboardController>(() => AdminDashboardController());
  }
}
