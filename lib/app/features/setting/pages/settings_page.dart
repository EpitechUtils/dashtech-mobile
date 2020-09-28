import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_event.dart';
import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_state.dart';
import 'package:epitech_intranet_mobile/app/features/setting/widgets/common_settings_widget.dart';
import 'package:epitech_intranet_mobile/app/features/setting/widgets/notification_settings_widget.dart';
import 'package:epitech_intranet_mobile/app/features/setting/widgets/planning_settings_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (BuildContext context) => getIt<SettingsBloc>(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) => state.when(
          init: (e) {
            BlocProvider.of<SettingsBloc>(context).add(SettingsEvent.loadSettings());
            return LoadingWidget();
          },
          loading: (e) => LoadingWidget(),
          error: (e) => _buildContent({}),
          loaded: (e) => _buildContent(e.settings),
        ),
      ),
    );
  }

  Widget _buildContent(Map<String, String> settings) {
    return SettingsList(
      sections: [
        CustomSection(child: CommonSettingsWidget(settings)),
        CustomSection(child: NotificationSettingsWidget(settings)),
        CustomSection(child: PlanningSettingsWidget(settings)),
      ],
    );
  }
}
