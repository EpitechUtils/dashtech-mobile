import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/card_history_card.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet_card_detail.dart';
import 'package:dashtech/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCardHistory extends GetView<AdminCardController> {
  final TrombiUser user;

  BottomSheetCardHistory(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Text(
            'admin_card_card_history'.tr,
            style: TextStyle(
              color: Color(textColor),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
              child: ListView.builder(
            itemCount: controller.cardHistory.length,
            itemBuilder: (_, index) => CardHistoryCard(cardHistory: controller.cardHistory[index]),
          )),
        ],
      ),
    );
  }
}
