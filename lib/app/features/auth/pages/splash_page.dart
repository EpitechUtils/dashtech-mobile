import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/delayed_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);

    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: DelayedAnimation(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: SvgPicture.asset(AssetsUtils.svg('logo_line_1')),
              ),
              delay: 100,
            ),
          ),
        ],
      ),
    );
  }
}
