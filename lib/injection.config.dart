// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'app/features/auth/bloc/auth/auth_bloc.dart';
import 'app/features/auth/business/data_sources/auth_data_source.dart';
import 'app/features/auth/bloc/auth_mode/auth_mode_bloc.dart';
import 'app/features/profile/business/use_cases/delete_profile_usecase.dart';
import 'app/features/profile/business/use_cases/find_profile_usecase.dart';
import 'app/features/profile/business/data_sources/friend_data_source.dart';
import 'app/core/graphql/graphql_injectable_module.dart';
import 'app/features/auth/business/use_cases/logout_usecase.dart';
import 'app/features/profile/bloc/profile/profile_bloc.dart';
import 'app/features/profile/business/data_sources/profile_data_source.dart';
import 'app/features/profile/bloc/profile_delete/profile_delete_bloc.dart';
import 'app/features/profile/business/use_cases/register_device_usecase.dart';
import 'app/core/secure_storage/secure_storage_injectable_module.dart';
import 'app/features/auth/bloc/signin/signin_bloc.dart';
import 'app/features/auth/business/use_cases/signin_usecase.dart';
import 'app/features/auth/business/use_cases/signup_usecase.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final secureStorageInjectableModule = _$SecureStorageInjectableModule();
  final graphqlInjectableModule = _$GraphqlInjectableModule();
  gh.lazySingleton<FlutterSecureStorage>(() => secureStorageInjectableModule.flutterSecureStorage);
  gh.lazySingleton<GraphQLClient>(() => graphqlInjectableModule.graphqlClient);
  gh.factory<ProfileDataSource>(() => ProfileDataSource(client: get<GraphQLClient>()));
  gh.factory<RegisterDeviceUseCase>(() => RegisterDeviceUseCase(get<ProfileDataSource>()));
  gh.factory<AuthDataSource>(() => AuthDataSource(client: get<GraphQLClient>()));
  gh.factory<AuthModeBloc>(() => AuthModeBloc(secureStorage: get<FlutterSecureStorage>()));
  gh.factory<DeleteProfileUseCase>(() => DeleteProfileUseCase(get<ProfileDataSource>()));
  gh.factory<FindProfileUseCase>(() => FindProfileUseCase(get<ProfileDataSource>()));
  gh.factory<FriendDataSource>(() => FriendDataSource(client: get<GraphQLClient>()));
  gh.factory<LogoutUseCase>(() => LogoutUseCase(get<AuthDataSource>()));
  gh.factory<ProfileBloc>(() =>
      ProfileBloc(findProfileUseCase: get<FindProfileUseCase>(), registerDeviceUseCase: get<RegisterDeviceUseCase>()));
  gh.factory<SigninUseCase>(() => SigninUseCase(get<AuthDataSource>()));
  gh.factory<SignupUseCase>(() => SignupUseCase(get<AuthDataSource>()));
  gh.factory<AuthBloc>(() => AuthBloc(
        secureStorage: get<FlutterSecureStorage>(),
        profileBloc: get<ProfileBloc>(),
        logoutUseCase: get<LogoutUseCase>(),
      ));
  gh.factory<ProfileDeleteBloc>(
      () => ProfileDeleteBloc(deleteProfileUseCase: get<DeleteProfileUseCase>(), authBloc: get<AuthBloc>()));
  gh.factory<SigninBloc>(() => SigninBloc(
        signinUseCase: get<SigninUseCase>(),
        authBloc: get<AuthBloc>(),
        profileBloc: get<ProfileBloc>(),
      ));
  return get;
}

class _$SecureStorageInjectableModule extends SecureStorageInjectableModule {}

class _$GraphqlInjectableModule extends GraphqlInjectableModule {}
