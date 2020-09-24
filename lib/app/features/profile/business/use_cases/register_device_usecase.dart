import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/data_sources/profile_data_source.dart';

@injectable
@lazySingleton
class RegisterDeviceUseCase implements UseCaseWithParams<bool, String> {
  final ProfileDataSource dataSource;

  RegisterDeviceUseCase(this.dataSource);

  @override
  Future<bool> call(String token) async => dataSource.registerNewDevice(token);
}
