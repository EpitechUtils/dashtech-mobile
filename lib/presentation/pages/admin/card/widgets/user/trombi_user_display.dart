import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet.dart';
import 'package:dashtech/presentation/shared/cached_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class TrombiUserDisplay extends GetView<AdminCardController> {
  final CardGetUsersByFilters$Query$TrombiUser user;

  TrombiUserDisplay(this.user);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      color: Colors.white,
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Get.bottomSheet(
            TrombiUserBottomSheet(user),
            backgroundColor: Color(fillColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
        },
        splashColor: const Color(primaryColor).withOpacity(0.2),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: Get.width - 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CachedCircleAvatar(
                        noPicture: Image.asset(
                          AssetsUtils.image('unknown', FileFormat.jpg),
                          width: 40,
                        ),
                        imagePath: AssetsUtils.profilePicture(user.picture),
                        radius: 40,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.title,
                            style: Get.textTheme.headline1!.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            user.login,
                            style: Get.textTheme.headline2,
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(
                    LineIcons.addressCard,
                    color: Color(user.card == null ? errorColor : successColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
