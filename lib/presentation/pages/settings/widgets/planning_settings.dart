import 'package:dashtech/application/settings/settings_controller.dart';
import 'package:dashtech/presentation/shared/title_subtitle_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanningSettings extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleSubtitleSubListCard(
          title: 'planning_settings'.tr,
          subtitle: 'planning_settings_desc'.tr,
          cards: [
            ActionCard(
              type: ActionCardType.switchOnOff,
              title: 'planning_settings_module_only'.tr,
              switchValue: false,
              action: () {},
            ),
            ActionCard(
              type: ActionCardType.switchOnOff,
              title: 'planning_settings_registered_only'.tr,
              switchValue: false,
              action: () {},
            ),
          ],
        ),
      ],
    );
  }
}
