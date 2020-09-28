import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/data_sources/settings_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/setting/models/setting_model.dart';
import 'package:injectable/injectable.dart';
import 'package:super_enum/super_enum.dart';

@injectable
@lazySingleton
class UpdateSettingsUseCase implements UseCaseWithParams<List<SettingModel>, SettingUpdate> {
  final SettingsDataSource dataSource;

  UpdateSettingsUseCase(this.dataSource);

  @override
  Future<List<SettingModel>> call(SettingUpdate data) async => dataSource.updateSetting(data);
}

class SettingUpdate extends Equatable {
  String setting;
  String value;

  SettingUpdate.fromRaw(this.setting, this.value);

  @override
  List<String> get props => [setting, value];
}
