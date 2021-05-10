import 'package:dashtech/application/shared/home/home_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/shared/settings/settings_page.dart';
import 'package:dashtech/presentation/pages/student/attendance/widgets/attendance_page.dart';
import 'package:dashtech/presentation/pages/student/dashboard/student_dashboard_page.dart';
import 'package:dashtech/presentation/pages/student/home/widgets/bottom_bar_widget.dart';
import 'package:dashtech/presentation/pages/student/planning/student_planning_page.dart';
import 'package:dashtech/presentation/shared/get_view_with_hook.dart';
import 'package:dashtech/presentation/shared/hooks/use_curve_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class StudentHomePage extends GetViewWithHook<HomeController> {
  Widget build(BuildContext context) {
    final AnimationController _controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final Animation<double> _animation = useCurve(_controller);

    return Scaffold(
      backgroundColor: const Color(fillColor),
      extendBody: true,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (int index) => controller.onPageChanged(index),
        children: <Widget>[
          StudentDashboardPage(),
          StudentPlanningPage(),
          Container(color: const Color(fillColor)),
          SettingsPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          backgroundColor: const Color(primaryColor),
          onPressed: () => Get.bottomSheet(
            AttendancePage(),
            backgroundColor: Colors.white,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: const Icon(
            LineIcons.handPointingUp,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomBar(
            index: controller.index.value,
            animationController: _controller,
            onTap: (int index) => controller.onPageChanged(index),
          )),
    );
  }
}
