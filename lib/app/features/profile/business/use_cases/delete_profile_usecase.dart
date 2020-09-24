import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/data_sources/profile_data_source.dart';

@injectable
@lazySingleton
class DeleteProfileUseCase implements UseCase<bool> {
  final ProfileDataSource dataSource;

  DeleteProfileUseCase(this.dataSource);

  @override
  Future<bool> call() async => dataSource.delete();
}
