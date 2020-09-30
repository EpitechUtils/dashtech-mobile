import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/data_sources/profile_data_source.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FindProfileAutologUseCase implements UseCase<String> {
  final ProfileDataSource dataSource;

  FindProfileAutologUseCase(this.dataSource);

  @override
  Future<String> call() async => dataSource.findAutolog();
}
