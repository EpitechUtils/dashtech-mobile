import 'package:epitech_intranet_mobile/app/features/setting/business/data_sources/settings_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/setting/models/setting_model.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';

@injectable
@lazySingleton
class FindProfileSettingsUseCase implements UseCase<List<SettingModel>> {
  final SettingsDataSource dataSource;

  FindProfileSettingsUseCase(this.dataSource);

  @override
  Future<List<SettingModel>> call() async => dataSource.findSettings();
}
