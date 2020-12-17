import 'package:flutter_file_store/presentation/core/icons/cajole_icons.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/pages/home/widgets/bottom_bar_widget.dart';
import 'package:flutter_file_store/presentation/shared/hooks/use_curve_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AnimationController _controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final Animation<double> _animation = useCurve(_controller);
    final ValueNotifier<PageController> _pageController = useState(
      PageController(),
    );
    final ValueNotifier<int> _currentIndex = useState(0);

    return Scaffold(
      backgroundColor: const Color(fillColor),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController.value,
          onPageChanged: (index) {
            _currentIndex.value = index;
          },
          children: <Widget>[
            Container(
              color: const Color(fillColor),
            ),
            Container(
              color: const Color(fillColor),
            ),
            Container(
              color: const Color(fillColor),
            ),
            Container(
              color: const Color(fillColor),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          backgroundColor: const Color(primaryColor),
          onPressed: () {},
          child: const Icon(
            CustomIcons.o,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWidget(
        index: _currentIndex.value,
        controller: _controller,
        onTap: (int index) {
          _currentIndex.value = index;
          _pageController.value.jumpToPage(index);
        },
      ),
    );
  }
}
