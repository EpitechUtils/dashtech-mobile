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
                    colors: [
                      Color(0xffFFAE00),
                      Color(0xffDB8E00),
                    ],
                    label: 'Remplacer la carte',
                  ),
                ),
                RoundedButton(
                  onPressed: () => controller.removeCard(user),
                  colors: [
                    Color(0xffFF3C2B),
                    Color(0xffDB1F1F),
                  ],
                  label: 'Supprimer la carte',
                ),
              ],
            ),
            replacement: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: RoundedButton(
                onPressed: () => controller.updateCardByNFC(user),
                label: 'Associer une nouvelle carte',
              ),
            ),
          )
        ],
      ),
    );
  }
}
