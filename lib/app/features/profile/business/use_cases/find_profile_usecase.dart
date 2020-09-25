import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/data_sources/profile_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';

@injectable
@lazySingleton
class FindProfileUseCase implements UseCase<ProfileModel> {
  final ProfileDataSource dataSource;

  FindProfileUseCase(this.dataSource);

  @override
  Future<ProfileModel> call() async => dataSource.findProfile();
}
