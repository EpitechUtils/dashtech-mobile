import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/auth/auth_repository.dart';
import 'package:dashtech/infrastructure/core/provider/auth_provider.connect.dart';
import 'package:dashtech/infrastructure/core/provider/intranet_provider.connect.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthProvider>(AuthProvider());
    Get.put<IntranetProvider>(IntranetProvider());
    Get.lazyPut<IAuthRepository>(
      () => AuthRepository(),
      fenix: true,
    );
  }
}
