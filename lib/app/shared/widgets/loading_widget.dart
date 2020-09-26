import 'dart:math';

import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Animator(
        tween: Tween<double>(begin: 0.8, end: 2 * pi),
        duration: Duration(milliseconds: 1500),
        curve: Curves.elasticOut,
        cycles: 0,
        builder: (context, anim, child) => Transform.rotate(
          angle: anim.value,
          child: SvgPicture.asset(
            AssetsUtils.svg('logo_block'),
            width: 50,
          ),
        ),
      ),
    );
  }
}
