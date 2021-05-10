import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/domain/profile/models/profile_setting.dart';
import 'package:dashtech/infrastructure/profile/input/profile_setting_input.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final IProfileRepository profileRepository = Get.find();

  RxMap<String, dynamic> currentSettings = <String, dynamic>{}.obs;
  RxMap<String, dynamic> fetchedSettings = <String, dynamic>{}.obs;
  RxBool isLoading = true.obs;
  RxBool isUpdating = false.obs;
  RxBool needsUpdate = false.obs;

  final List<Worker> workers = <Worker>[].obs;

  @override
  Future<void> onInit() async {
    _fetchSettings();
    _initWorkers();
    super.onInit();
  }

  Future<void> onClose() async {
    workers.forEach((worker) => worker.dispose());
    super.onClose();
  }

  Future<void> _fetchSettings() async {
    Either<BaseFailure, List<ProfileSetting>> failOrSettings =
        await this.profileRepository.getSettings();

    failOrSettings.fold(
      (BaseFailure left) {
        isLoading.value = false;
      },
      (List<ProfileSetting> right) {
        right.forEach((s) {
          fetchedSettings[s.setting] = s.value;
          currentSettings[s.setting] = s.value;
        });
        update();
        isLoading.value = false;
      },
    );
  }

  Future<void> saveSettings() async {
    isUpdating.value = true;
    List<ProfileSettingInput> inputs = [];
    currentSettings.forEach((key, value) =>
        inputs.add(ProfileSettingInput(setting: key, value: value.toString())));

    print(inputs);

    Either<BaseFailure, List<ProfileSetting>> failOrSavedSettings =
        await this.profileRepository.updateSettings(inputs);

    failOrSavedSettings.fold(
      (BaseFailure left) {
        isUpdating.value = false;
      },
      (List<ProfileSetting> right) {
        right.forEach((s) {
          fetchedSettings[s.setting] = s.value;
          currentSettings[s.setting] = s.value;
        });
        update();
        isUpdating.value = false;
        needsUpdate.value = false;
      },
    );
  }

  T? getSetting<T>({
    required String category,
    required String setting,
    required T defaultVal,
  }) {
    try {
      dynamic? data = currentSettings['settings.$category.$setting'];
      /*return data != null
          ? T is bool
              ? _parseBool(data)
              : data as T
          : defaultVal;*/
      return defaultVal;
    } catch (ignored) {
      return defaultVal;
    }
  }

  void updateSetting<T>({
    required String category,
    required String setting,
    required T value,
  }) {
    currentSettings['settings.$category.$setting'] = value;
    update();
  }

  void toggleBoolSetting(
      {required String category,
      required String setting,
      required bool defaultVal}) {
    bool currentValue = currentSettings['settings.$category.$setting'] != null
        ? _parseBool(currentSettings['settings.$category.$setting'])
        : defaultVal;
    updateSetting<bool>(
      category: category,
      setting: setting,
      value: !currentValue,
    );
  }

  bool _parseBool(dynamic data) {
    return data.toString().toLowerCase() == 'true';
  }

  void _initWorkers() {
    workers.add(ever(
      currentSettings,
      (Map<String, dynamic> s) {
        if (!isLoading.value)
          needsUpdate.value = !mapEquals(fetchedSettings, s);
      },
    ));
  }
}
