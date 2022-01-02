import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/common/rounded_button.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet_card_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCardInfo extends GetView<AdminCardController> {
  final CardGetUsersByFilters$Query$TrombiUserType user;

  BottomSheetCardInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Text(
            "admin_card_student_details".tr,
            style: TextStyle(
              color: Color(textColor),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          TrombiUserBottomSheetDetail(
            title: ['word_first_name'.tr, 'word_last_name'.tr].join(" / "),
            value: user.title,
          ),
          TrombiUserBottomSheetDetail(
            title: 'word_email'.tr,
            value: user.login,
          ),
          TrombiUserBottomSheetDetail(
            title: 'word_card'.tr,
            value: user.card == null ? "word_nothing".tr : user.card!.nfcTag,
            color: user.card == null ? Color(errorColor) : Color(successColor),
          ),
          Visibility(
            visible: user.card != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: RoundedButton(
                    onPressed: () => controller.updateCardByNFC(user),
                    color: Color(warnColor),
                    label: 'admin_card_associate_replace'.tr,
                  ),
                ),
                RoundedButton(
                  onPressed: () => controller.removeCard(user),
                  color: Color(errorColor),
                  label: 'admin_card_associate_delete'.tr,
                ),
              ],
            ),
            replacement: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: RoundedButton(
                onPressed: () => controller.updateCardByNFC(user),
                label: 'admin_card_associate_new'.tr,
              ),
            ),
          )
        ],
      ),
    );
  }
}
