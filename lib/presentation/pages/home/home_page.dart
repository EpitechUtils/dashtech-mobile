import 'package:flutter/material.dart';
import 'package:dashtech/application/home/home_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/dashboard/dashboard_page.dart';
import 'package:dashtech/presentation/pages/home/widgets/bottom_bar_widget.dart';
import 'package:dashtech/presentation/shared/hooks/use_curve_animation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends HookWidget {
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      allowFontScaling: true,
      designSize: const Size(1080, 2160),
    );
    final AnimationController _controller = useAnimationController(
      duration: const Duration(milliseconds: 1500),
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
            Container(color: const Color(fillColor)),
            Container(color: const Color(fillColor)),
            Container(color: const Color(fillColor)),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ScaleTransition(
          scale: _animation,
          child: FloatingActionButton(
            backgroundColor: const Color(primaryColor),
            onPressed: () {},
            child: const Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: controller.index.value,
          controller: _controller,
          onTap: (int index) => controller.onPageChanged(index),
        ),
      ),
    );
  }
}
