import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';

@injectable
@lazySingleton
class RegisterDeviceUseCase implements UseCaseWithParams<bool, Map<String, String>> {
  final AuthDataSource dataSource;

  RegisterDeviceUseCase(this.dataSource);

  @override
  Future<bool> call(Map<String, String> data) async => dataSource.registerNewDevice(data);
}
