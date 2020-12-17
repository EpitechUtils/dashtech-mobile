import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

enum SignupKind { restorer, user, unset }

class SignupController extends GetxController {
  SignupController({@required this.authRepository});

  IAuthRepository authRepository;

  final RxBool isLoading = false.obs;

  final TextEditingController emailUserTextController = TextEditingController();
}
