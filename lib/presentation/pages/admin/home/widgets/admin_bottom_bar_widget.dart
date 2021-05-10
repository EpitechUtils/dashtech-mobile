import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AdminBottomBar extends StatelessWidget {
  const AdminBottomBar({
    this.key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Key? key;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: [
        LineIcons.home,
        LineIcons.calendarCheck,
        LineIcons.qrcode,
        LineIcons.wrench,
      ],
      //elevation: 10,
      splashColor: const Color(primaryColor),
      activeColor: const Color(primaryColor),
      inactiveColor: const Color(greyColor),
      iconSize: 30,
      activeIndex: index,
      onTap: (int index) => onTap(index),
      gapLocation: GapLocation.none,
    );
  }
}
