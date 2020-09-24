import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/delayed_animation_widget.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: DelayedAnimation(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: Image.asset(AssetsUtils.image('epitech_white_logo'), color: Colors.white),
              ),
              delay: 100,
            ),
          ),
        ],
      ),
    );
  }
}
