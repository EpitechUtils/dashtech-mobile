import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  RxMap<String, dynamic> newSettings = <String, dynamic>{}.obs;
  RxMap<String, dynamic> currentSettings = <String, dynamic>{}.obs;
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    _fetchSettings();
    super.onInit();
  }

  Future<void> _fetchSettings() async {
    Future.delayed(Duration(seconds: 2), () {
      currentSettings['settings.notifications.enable'] = true;
      currentSettings['settings.notifications.activity'] = true;
      currentSettings['settings.notifications.project'] = false;
      currentSettings['settings.notifications.appointment'] = false;
      update();
      isLoading.value = false;
    });
  }

  T getSetting<T>({String category, String setting, T defaultVal}) {
    try {
      return currentSettings['settings.$category.$setting'];
    } catch (ignored) {
      return defaultVal;
    }
  }

  void updateSetting<T>({String category, String setting, T value}) {
    currentSettings['settings.$category.$setting'] = value;
    newSettings['settings.$category.$setting'] = value;
    update();
  }

  void toggleBoolSetting({String category, String setting}) {
    bool currentValue = currentSettings['settings.$category.$setting'];
    updateSetting<bool>(
      category: category,
      setting: setting,
      value: !currentValue,
    );
  }
}
