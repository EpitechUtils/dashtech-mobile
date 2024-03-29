import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    this.key,
    this.animationController,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Key? key;
  final AnimationController? animationController;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: [
        LineIcons.home,
        LineIcons.calendar,
        LineIcons.user,
        LineIcons.wrench,
      ],
      //elevation: 10,
      splashColor: const Color(primaryColor),
      activeColor: const Color(primaryColor),
      inactiveColor: const Color(greyColor),
      notchAndCornersAnimation: animationController,
      iconSize: 30,
      activeIndex: index,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 5,
      rightCornerRadius: 5,
      onTap: (int index) => onTap(index),
    );
  }
}
