import 'package:dashtech/application/common/settings/settings_controller.dart';
import 'package:dashtech/presentation/common/title_subtitle_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlanningSettings extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => TitleSubtitleSubListCard(
            title: 'planning_settings'.tr,
            subtitle: 'planning_settings_desc'.tr,
            cards: [
              ActionCard(
                type: ActionCardType.switchOnOff,
                title: 'planning_settings_module_only'.tr,
                switchValue: controller.getSetting<bool>(
                  category: 'planning',
                  setting: 'module_only',
                  defaultVal: false,
                )!,
                action: () => controller.toggleBoolSetting(
                  category: 'planning',
                  setting: 'module_only',
                  defaultVal: false,
                ),
              ),
              ActionCard(
                type: ActionCardType.switchOnOff,
                title: 'planning_settings_registered_only'.tr,
                switchValue: controller.getSetting<bool>(
                  category: 'planning',
                  setting: 'registered_only',
                  defaultVal: false,
                )!,
                action: () => controller.toggleBoolSetting(
                  category: 'planning',
                  setting: 'registered_only',
                  defaultVal: false,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
