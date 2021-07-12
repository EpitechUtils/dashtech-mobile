import 'package:dashtech/application/common/settings/settings_controller.dart';
import 'package:dashtech/presentation/common/title_subtitle_list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettings extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => TitleSubtitleSubListCard(
            title: 'notification_settings'.tr,
            subtitle: 'notification_settings_desc'.tr,
            cards: [
              ActionCard(
                type: ActionCardType.switchOnOff,
                title: 'notification_settings'.tr,
                switchValue: controller.getSetting<bool>(
                  category: 'notifications',
                  setting: 'enable',
                  defaultVal: true,
                )!,
                action: () => controller.toggleBoolSetting(
                  category: 'notifications',
                  setting: 'enable',
                  defaultVal: true,
                ),
              ),
              ActionCard(
                type: ActionCardType.switchOnOff,
                title: 'notification_settings_activity'.tr,
                switchValue: controller.getSetting<bool>(
                  category: 'notifications',
                  setting: 'activity',
                  defaultVal: true,
                )!,
                action: () => controller.toggleBoolSetting(
                  category: 'notifications',
                  setting: 'activity',
                  defaultVal: true,
                ),
              ),
              ActionCard(
                type: ActionCardType.switchOnOff,
                title: 'notification_settings_appointment'.tr,
                switchValue: controller.getSetting<bool>(
                  category: 'notifications',
                  setting: 'appointment',
                  defaultVal: true,
                )!,
                action: () => controller.toggleBoolSetting(
                  category: 'notifications',
                  setting: 'appointment',
                  defaultVal: true,
                ),
              ),
              ActionCard(
                type: ActionCardType.switchOnOff,
                title: 'notification_settings_project'.tr,
                switchValue: controller.getSetting<bool>(
                  category: 'notifications',
                  setting: 'project',
                  defaultVal: false,
                )!,
                action: () => controller.toggleBoolSetting(
                  category: 'notifications',
                  setting: 'project',
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
