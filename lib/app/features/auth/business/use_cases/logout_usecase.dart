import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';

@injectable
@lazySingleton
class LogoutUseCase implements UseCaseWithParams<bool, String> {
  final AuthDataSource dataSource;

  LogoutUseCase(this.dataSource);

  @override
  Future<bool> call(String identifier) async => dataSource.logoutUser(identifier);
}
