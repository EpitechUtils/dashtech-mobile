import 'package:dashtech/application/common/settings/settings_controller.dart';
import 'package:dashtech/presentation/pages/common/settings/widgets/notification_settings.dart';
import 'package:dashtech/presentation/pages/common/settings/widgets/planning_settings.dart';
import 'package:dashtech/presentation/pages/common/settings/widgets/settings_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => Visibility(
              visible: !controller.isLoading.value,
              replacement: Container(),
              child: Column(
                children: [
                  NotificationSettings(),
                  const SizedBox(height: 20),
                  PlanningSettings(),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
