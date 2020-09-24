import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/auth_profile_model.dart';

@injectable
@lazySingleton
class SigninUseCase implements UseCaseWithParams<AuthProfileModel, Credentials> {
  final AuthDataSource dataSource;

  SigninUseCase(this.dataSource);

  @override
  Future<AuthProfileModel> call(Credentials credentials) async {
    return dataSource.signin(credentials);
  }
}

class Credentials extends Equatable {
  final String username;
  final String password;

  Credentials.fromCredentials(Credentials credentials)
      : username = credentials.username.toLowerCase(),
        password = credentials.password;

  Credentials.fromForm(GlobalKey<FormBuilderState> form)
      : username = form.currentState.fields['username'].currentState.value.toString().toLowerCase(),
        password = form.currentState.fields['password'].currentState.value.toString();

  @override
  List<Object> get props => [username, password];
}
