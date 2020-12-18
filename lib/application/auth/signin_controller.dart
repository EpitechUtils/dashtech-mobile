import 'package:flutter_file_store/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:flutter_file_store/domain/auth/failures/auth_failure.dart';
import 'package:flutter_file_store/domain/auth/models/auth_profile.dart';
import 'package:flutter_file_store/domain/auth/models/credentials.dart';
import "package:flutter_file_store/presentation/core/utils/snack_bar_utils.dart";
import 'package:flutter_file_store/presentation/pages/auth/sign_in/widgets/steps/sign_in_step_two_code_fields.dart';
import 'package:dartz/dartz.dart';
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:get/state_manager.dart";

class SigninController extends GetxController {
  SigninController({@required this.authRepository});

  final IAuthRepository authRepository;

  final RxBool isLoading = false.obs;
  final RxBool isWaitingForCode = false.obs;
  final RxBool verificationCodeFormIsValid = false.obs;
  final RxBool verificationCodeIsValid = false.obs;

  final TextEditingController emailTextController = TextEditingController();

  List<FocusNode> focusNodes;
  List<TextEditingController> codes;
  Worker codeWorker;

  @override
  void onInit() {
    codeWorker = ever(verificationCodeFormIsValid, handleValidCode);
    codes = List<TextEditingController>.generate(
      6,
      (_) => TextEditingController(),
    );
    focusNodes = List<FocusNode>.generate(
      6,
      (_) => FocusNode(),
    );

    super.onInit();
  }

  @override
  void onClose() {
    codes.forEach((TextEditingController controller) => controller.dispose());
    focusNodes.forEach((FocusNode focusNode) => focusNode.dispose());
    codeWorker.dispose();
  }

  // Send email code by email
  Future<void> sendEmailCode() async {
    isLoading.value = true;
    final Either<AuthFailure, bool> failureOrYes = await authRepository
        .sendEmailCode(emailTextController.text.toLowerCase());

    failureOrYes.fold(
      (AuthFailure left) => SnackBarUtils.error(message: 'http_common'),
      (bool _) {
        isLoading.value = false;
        isWaitingForCode.value = true;
      },
    );
  }

  // Called when verification code is valid
  void handleValidCode(bool isValid) {
    if (!isValid) {
      //_reset();
      return;
    }
    validateVerificationCode(code);
  }

  // Send request to API to validate the verification code previously sent
  void validateVerificationCode(String code) async {
    isLoading.value = true;

    final Either<AuthFailure, AuthProfile> failureOrAuthProfile =
        await authRepository.confirmEmailCode(
            emailTextController.text.toLowerCase(), code);

    failureOrAuthProfile.fold(
      (AuthFailure left) {
        isLoading.value = false;
        left.map(
          unexpected: (_) => SnackBarUtils.error(message: 'unexpected'),
          profileNotFound: (_) =>
              SnackBarUtils.error(message: 'profileNotFound'),
          invalidCode: (_) => SnackBarUtils.error(message: 'invalidCode'),
          expiredCode: (_) => SnackBarUtils.error(message: 'expiredCode'),
        );
      },
      (AuthProfile right) {
        isLoading.value = false;
        SnackBarUtils.success(message: 'cOk');
      },
    );
  }

  void resetFields() {
    isWaitingForCode.value = false;
    codes.forEach((controller) => controller.text = '');
    emailTextController.text = '';
  }

  String get code => codes.map((controller) => controller.text).join('');

  void checkFormValidity() {
    verificationCodeFormIsValid.value = signInCodeForm.currentState.mounted &&
        signInCodeForm.currentState.validate();
  }
}
