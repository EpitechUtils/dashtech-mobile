import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/infrastructure/card/card_repository.dart';
import 'package:get/get.dart';

class AdminCardBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICardRepository>(() => CardRepository());
    Get.lazyPut<AdminCardController>(() => AdminCardController());
  }
}
