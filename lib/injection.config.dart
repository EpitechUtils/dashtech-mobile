// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app/features/auth/bloc/auth/auth_bloc.dart';
import 'app/features/auth/business/data_sources/auth_data_source.dart';
import 'app/features/auth/bloc/auth_mode/auth_mode_bloc.dart';
import 'app/features/dashboard/bloc/dash_activities/dash_activities_bloc.dart';
import 'app/features/dashboard/business/data_sources/dashboard_data_source.dart';
import 'app/features/profile/business/use_cases/delete_profile_usecase.dart';
import 'app/features/profile/business/use_cases/find_profile_usecase.dart';
import 'app/features/setting/business/use_cases/find_settings_usecase.dart';
import 'app/features/dashboard/business/use_cases/find_week_activities_usecase.dart';
import 'app/core/firebase/firebase_injectable_module.dart';
import 'app/core/graphql/graphql_injectable_module.dart';
import 'app/core/http_client/http_client_injectable_module.dart';
import 'app/features/auth/business/use_cases/load_profiles_usecase.dart';
import 'app/features/auth/business/use_cases/logout_usecase.dart';
import 'app/features/navigation/bloc/navigation_bloc.dart';
import 'app/features/profile/bloc/profile/profile_bloc.dart';
import 'app/features/profile/business/data_sources/profile_data_source.dart';
import 'app/features/auth/business/use_cases/register_device_usecase.dart';
import 'app/core/secure_storage/secure_storage_injectable_module.dart';
import 'app/features/setting/bloc/settings_bloc.dart';
import 'app/features/setting/business/data_sources/settings_data_source.dart';
import 'app/features/auth/bloc/signin/signin_bloc.dart';
import 'app/features/auth/business/use_cases/signin_usecase.dart';
import 'app/features/setting/business/use_cases/update_settings_usecase.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final httpClientInjectableModule = _$HttpClientInjectableModule();
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final secureStorageInjectableModule = _$SecureStorageInjectableModule();
  final graphqlInjectableModule = _$GraphqlInjectableModule();
  gh.lazySingleton<Dio>(() => httpClientInjectableModule.dio);
  gh.lazySingleton<FirebaseMessaging>(() => firebaseInjectableModule.firebaseMessaging);
  gh.lazySingleton<FlutterSecureStorage>(() => secureStorageInjectableModule.flutterSecureStorage);
  gh.lazySingleton<GraphQLClient>(() => graphqlInjectableModule.graphqlClient);
  gh.factory<ProfileDataSource>(() => ProfileDataSource(client: get<GraphQLClient>()));
  gh.factory<SettingsDataSource>(() => SettingsDataSource(client: get<GraphQLClient>()));
  gh.factory<UpdateSettingsUseCase>(() => UpdateSettingsUseCase(get<SettingsDataSource>()));
  gh.factory<AuthDataSource>(() => AuthDataSource(client: get<GraphQLClient>()));
  gh.factory<DashboardDataSource>(() => DashboardDataSource(client: get<GraphQLClient>()));
  gh.factory<DeleteProfileUseCase>(() => DeleteProfileUseCase(get<ProfileDataSource>()));
  gh.factory<FindProfileUseCase>(() => FindProfileUseCase(get<ProfileDataSource>()));
  gh.factory<FindSettingsUseCase>(() => FindSettingsUseCase(get<SettingsDataSource>()));
  gh.factory<FindWeekActivitiesUseCase>(() => FindWeekActivitiesUseCase(get<DashboardDataSource>()));
  gh.factory<LoadProfilesUseCase>(() => LoadProfilesUseCase(get<AuthDataSource>()));
  gh.factory<LogoutUseCase>(() => LogoutUseCase(get<AuthDataSource>()));
  gh.factory<NavigationBloc>(() => NavigationBloc(findWeekActivitiesUseCase: get<FindWeekActivitiesUseCase>()));
  gh.factory<ProfileBloc>(() => ProfileBloc(findProfileUseCase: get<FindProfileUseCase>()));
  gh.factory<RegisterDeviceUseCase>(() => RegisterDeviceUseCase(get<AuthDataSource>()));
  gh.factory<SettingsBloc>(() => SettingsBloc(
      findProfileSettingsUseCase: get<FindSettingsUseCase>(), updateSettingsUseCase: get<UpdateSettingsUseCase>()));
  gh.factory<SigninUseCase>(() => SigninUseCase(get<AuthDataSource>()));
  gh.factory<AuthBloc>(() => AuthBloc(
        secureStorage: get<FlutterSecureStorage>(),
        profileBloc: get<ProfileBloc>(),
        logoutUseCase: get<LogoutUseCase>(),
        registerDeviceUseCase: get<RegisterDeviceUseCase>(),
      ));
  gh.factory<AuthModeBloc>(
      () => AuthModeBloc(secureStorage: get<FlutterSecureStorage>(), loadProfilesUseCase: get<LoadProfilesUseCase>()));
  gh.factory<DashActivitiesBloc>(() => DashActivitiesBloc(findWeekActivitiesUseCase: get<FindWeekActivitiesUseCase>()));
  gh.factory<SigninBloc>(() => SigninBloc(
        signinUseCase: get<SigninUseCase>(),
        authBloc: get<AuthBloc>(),
        profileBloc: get<ProfileBloc>(),
      ));
  return get;
}

class _$HttpClientInjectableModule extends HttpClientInjectableModule {}

class _$FirebaseInjectableModule extends FirebaseInjectableModule {}

class _$SecureStorageInjectableModule extends SecureStorageInjectableModule {}

class _$GraphqlInjectableModule extends GraphqlInjectableModule {}
