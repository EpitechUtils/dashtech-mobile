import 'package:dashtech/application/common/settings/settings_controller.dart';
import 'package:dashtech/domain/profile/adapters/profile_repository_adapter.dart';
import 'package:dashtech/infrastructure/profile/profile_repository.dart';
import 'package:get/get.dart';

class SettingsBindings extends Bindings {
  void dependencies() {
    Get.lazyPut<IProfileRepository>(() => ProfileRepository());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
