import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/auth/auth_repository.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(
      () => AuthRepository(
          graphqlService: Get.find(),
          httpService: Get.find(),
          tokenService: Get.find(),
          storageService: Get.find()),
      fenix: true,
    );
  }
}
