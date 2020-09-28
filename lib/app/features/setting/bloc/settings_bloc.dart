import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_event.dart';
import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_state.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/use_cases/find_profile_settings_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/setting/models/setting_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  FindProfileSettingsUseCase findProfileSettingsUseCase;

  SettingsBloc({this.findProfileSettingsUseCase}) : super(SettingsState.init());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    yield* event.when(
      loadSettings: (e) => _mapLoadSettingsToState(e),
      changeSetting: (e) => _mapChangeSettingToState(e),
    );
  }

  Stream<SettingsState> _mapLoadSettingsToState(LoadSettings event) async* {
    yield SettingsState.loading();
    try {
      List<SettingModel> rawSettings = await findProfileSettingsUseCase();
      Map<String, String> settings = {};
      rawSettings.forEach((setting) => settings[setting.setting] = setting.value);
      yield SettingsState.loaded(settings: settings);
    } catch (err) {
      print(err);
      yield SettingsState.error();
    }
  }

  Stream<SettingsState> _mapChangeSettingToState(ChangeSetting event) async* {
    // TODO: Fill it
    print(event.setting);
    print(event.value);
  }
}
