import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_file_store/infrastructure/auth/auth_repository.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(
      () => AuthRepository(
        graphqlService: Get.find(),
        tokenService: Get.find(),
      ),
      fenix: true,
    );
  }
}
