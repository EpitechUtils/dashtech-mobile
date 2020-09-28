import 'package:epitech_intranet_mobile/app/core/error/exceptions.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/graphql/settings_mutations.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/graphql/settings_queries.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/use_cases/update_settings_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/setting/models/setting_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@injectable
@lazySingleton
class SettingsDataSource {
  final GraphQLClient client;

  SettingsDataSource({@required this.client}) : assert(client != null);

  /// Find all saved settings
  Future<List<SettingModel>> findSettings() async {
    final QueryResult result = await client.query(QueryOptions(
      documentNode: gql(settingsGetAll),
    ));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['settingsGetAll'] as List;
    return json.map((dynamic model) => SettingModel.fromJson(model)).toList();
  }

  /// Update setting and get all updates
  Future<List<SettingModel>> updateSetting(SettingUpdate data) async {
    final QueryResult result = await client.query(
        QueryOptions(documentNode: gql(settingsUpdate), variables: {'setting': data.setting, 'value': data.value}));
    if (result.hasException) {
      manageError(result);
    }
    final json = result.data['settingsUpdate'] as List;
    return json.map((dynamic model) => SettingModel.fromJson(model)).toList();
  }
}