import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthAppBar extends AppBar {
  AuthAppBar(BuildContext context, {Key? key})
      : super(
          key: key,
          shape: const CurvedShape(),
          leading: null,
          automaticallyImplyLeading: false,
          elevation: 2,
          title: Container(
            child: SvgPicture.asset(
              AssetsUtils.svg('logo_line'),
              color: Colors.white,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
        );
}

class CurvedShape extends ContinuousRectangleBorder {
  const CurvedShape();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) => Path()
    ..lineTo(0, rect.size.height)
    ..quadraticBezierTo(
      rect.size.width / 2,
      rect.size.height + 17 * 2,
      rect.size.width,
      rect.size.height,
    )
    ..lineTo(rect.size.width, 0)
    ..close();
}
