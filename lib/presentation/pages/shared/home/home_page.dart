import 'package:dashtech/application/shared/home/home_controller.dart';
import 'package:dashtech/presentation/pages/admin/home/admin_home_page.dart';
import 'package:dashtech/presentation/pages/student/home/student_home_page.dart';
import 'package:dashtech/presentation/shared/get_view_with_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends GetViewWithHook<HomeController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    print(controller.intranetRightsService.canManageAttendances());

    return controller.intranetRightsService.canManageAttendances()
        ? AdminHomePage()
        : StudentHomePage();
  }
}
