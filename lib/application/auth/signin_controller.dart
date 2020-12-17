import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:flutter_file_store/domain/auth/models/credentials.dart';
import "package:flutter_file_store/presentation/core/utils/snack_bar_utils.dart";
import "package:flutter_file_store/presentation/pages/home/home_page.dart";
import 'package:dartz/dartz.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/state_manager.dart";

class SigninController extends GetxController {
  SigninController({@required this.authRepository});

  IAuthRepository authRepository;

  RxBool isLoading = false.obs;

  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  Future<void> login() async {
    isLoading.value = true;
    _foldRight(null);
    /*final Either<AuthFailure, AuthProfile> failureOrAuthProfile =
        await authRepository.signin(
      Credentials(
        email: emailTextController.text.toLowerCase(),
        password: passwordTextController.text,
      ),
    );
    failureOrAuthProfile.fold(
      (AuthFailure left) => _foldLeft(left),
      (AuthProfile right) => _foldRight(right),
    );*/
  }

  void _foldRight(AuthProfile profile) {
    isLoading.value = false;
    Get.to(HomePage());
  }

  void _foldLeft(AuthFailure failure) {
    isLoading.value = false;
    failure.map(
      unexpected: (_) => SnackBarUtils.error(
        message: 'http_common',
      ),
      alreadyExist: (_) => SnackBarUtils.error(
        message: 'http_auth_already_exist',
      ),
      unauthorized: (_) => SnackBarUtils.error(
        message: 'http_auth_not_found',
      ),
      domainUnauthorized: (_) => SnackBarUtils.error(
        message: 'http_auth_domain_unauthorized',
      ),
    );
  }
}
