import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/auth_profile_model.dart';

@injectable
@lazySingleton
class SignupUseCase implements UseCaseWithParams<AuthProfileModel, UserRegister> {
  final AuthDataSource dataSource;

  SignupUseCase(this.dataSource);

  @override
  Future<AuthProfileModel> call(UserRegister userRegister) async {
    return dataSource.signup(userRegister);
  }
}

class UserRegister extends Equatable {
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String gender;
  final String birthDate;

  UserRegister.fromForm(GlobalKey<FormBuilderState> form)
      : username = form.currentState.fields['username'].currentState.value,
        firstName = form.currentState.fields['firstName'].currentState.value,
        lastName = form.currentState.fields['lastName'].currentState.value,
        email = form.currentState.fields['email'].currentState.value,
        password = form.currentState.fields['password'].currentState.value,
        gender = form.currentState.fields['gender'].currentState.value,
        birthDate = form.currentState.fields['birthDate'].currentState.value.toString();

  @override
  List<Object> get props => [firstName, lastName, email, password, gender, birthDate];
}
