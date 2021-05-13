import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet_card_detail.dart';
import 'package:dashtech/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetCardInfo extends GetView<AdminCardController> {
  final TrombiUser user;

  BottomSheetCardInfo(this.user);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Text(
            "Détails sur l'étudiant(e)",
            style: TextStyle(
              color: Color(textColor),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 15),
          TrombiUserBottomSheetDetail(
            title: "Prénom / Nom",
            value: user.title,
          ),
          TrombiUserBottomSheetDetail(
            title: "Adresse Email",
            value: user.login,
          ),
          TrombiUserBottomSheetDetail(
            title: "Carte",
            value: user.card == null ? "Aucune" : user.card!.nfcTag,
            color: user.card == null ? Color(errorColor) : Color(successColor),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: RoundedButton(
                  onPressed: controller.searchForNfcTag,
                  label: 'Associer une carte',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
