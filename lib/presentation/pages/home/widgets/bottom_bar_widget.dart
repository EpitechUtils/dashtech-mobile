import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter_file_store/presentation/core/icons/cajole_icons.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({
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
        CustomIcons.attached,
        CustomIcons.picture,
        CustomIcons.user,
        CustomIcons.gilft,
      ],
      //elevation: 10,
      splashColor: const Color(primaryColor),
      activeColor: const Color(primaryColor),
      inactiveColor: const Color(greyColor),
      notchAndCornersAnimation: controller,
      iconSize: 20,
      activeIndex: index,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 5,
      rightCornerRadius: 5,
      onTap: (int index) => onTap(index),
    );
  }
}
