import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';

@injectable
@lazySingleton
class LoadProfilesUseCase implements UseCaseWithParams<List<ProfileModel>, String> {
  final AuthDataSource dataSource;

  LoadProfilesUseCase(this.dataSource);

  @override
  Future<List<ProfileModel>> call(String deviceIdentifier) async {
    return dataSource.getRegisteredProfiles(deviceIdentifier);
  }
}
