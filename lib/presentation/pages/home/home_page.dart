import 'package:dashtech/application/home/home_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/attendance/widgets/attendance_page.dart';
import 'package:dashtech/presentation/pages/dashboard/dashboard_page.dart';
import 'package:dashtech/presentation/pages/home/widgets/bottom_bar_widget.dart';
import 'package:dashtech/presentation/pages/planning/planning_page.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:dashtech/presentation/shared/get_view_with_hook.dart';
import 'package:dashtech/presentation/shared/hooks/use_curve_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends GetViewWithHook<HomeController> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      allowFontScaling: true,
      designSize: const Size(1080, 2160),
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    final AnimationController _controller = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final Animation<double> _animation = useCurve(_controller);

    return Obx(
      () => Scaffold(
        backgroundColor: const Color(fillColor),
        extendBody: true,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          onPageChanged: (int index) => controller.onPageChanged(index),
          children: <Widget>[
            DashboardPage(),
            PlanningPage(),
            Container(color: const Color(fillColor)),
            Container(color: const Color(fillColor)),
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
              LineIcons.hand_stop_o,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: controller.index.value,
          animationController: _controller,
          onTap: (int index) => controller.onPageChanged(index),
        ),
      ),
    );
  }
}
