import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 65, height: 65, child: Lottie.asset(AssetsUtils.animation('loader'), repeat: true)),
    );
  }
}
