import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/card.dart' as models;
import 'package:dashtech/domain/card/models/card_history.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/shared/history_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class CardHistoryCard extends GetView<AdminCardController> {
  final CardHistoryByLogin$Query$CardHistory cardHistory;

  CardHistoryCard({required this.cardHistory});

  @override
  Widget build(BuildContext context) {
    final DateFormat format = DateFormat.yMMMMEEEEd(Get.locale!.toLanguageTag());
    return SizedBox(
      height: 70,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HistoryUtils.getIconByType(cardHistory.eventType),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    HistoryUtils.getEventDescription(cardHistory.eventType).tr,
                    style: Get.textTheme.headline1!.copyWith(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    ['word_by'.tr, cardHistory.profile.email].join(" "),
                    style: Get.textTheme.headline2!.copyWith(fontSize: 13),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    ['word_at'.tr, cardHistory.createdAt.toString()].join(" "),
                    style: Get.textTheme.headline2!.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
