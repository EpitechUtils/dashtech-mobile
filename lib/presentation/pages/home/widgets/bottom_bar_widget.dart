import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:line_icons/line_icons.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    this.key,
    this.controller,
    this.index,
    this.onTap,
  }) : super(key: key);

  final Key key;
  final AnimationController controller;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: [
        LineIcons.home,
        LineIcons.users,
        LineIcons.heart_o,
        LineIcons.user,
      ],
      //elevation: 10,
      splashColor: const Color(primaryColor),
      activeColor: const Color(primaryColor),
      inactiveColor: const Color(greyColor),
      notchAndCornersAnimation: controller,
      iconSize: 21,
      activeIndex: index,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 5,
      rightCornerRadius: 5,
      onTap: (int index) => onTap(index),
    );
  }
}
