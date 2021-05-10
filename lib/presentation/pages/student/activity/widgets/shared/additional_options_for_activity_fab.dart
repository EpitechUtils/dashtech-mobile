import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AdditionalOptionsForActivityFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      fabElevation: 2,
      fabOpenIcon: Icon(LineIcons.horizontalEllipsis, color: Colors.white),
      fabCloseIcon: Icon(LineIcons.times, color: Colors.white),
      ringColor: Color(primaryColor).withAlpha(25),
      ringDiameter: 250.0,
      ringWidth: 70.0,
      fabSize: 60,
      animationDuration: Duration(milliseconds: 200),
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.group, color: Color(textColor)),
        ),
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(
            Icons.notifications_active_sharp,
            color: Color(textColor),
          ),
        ),
        RawMaterialButton(
          onPressed: () {},
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(
            Icons.calendar_today_rounded,
            color: Color(textColor),
          ),
        ),
      ],
    );
  }
}
