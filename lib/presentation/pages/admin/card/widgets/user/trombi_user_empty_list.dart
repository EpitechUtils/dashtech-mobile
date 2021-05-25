import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet.dart';
import 'package:dashtech/presentation/shared/cached_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

class TrombiUserEmptyList extends GetView<AdminCardController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetsUtils.svg('not-found'),
          width: Get.width / 2.5,
        ),
        const SizedBox(height: 30),
        Text(
          "admin_card_empty_promo_title".tr,
          style: Get.textTheme.headline1,
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: (Get.width / 3) * 2,
          child: Text(
            "admin_card_empty_promo_text".tr,
            textAlign: TextAlign.center,
            style: Get.textTheme.headline2,
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}
