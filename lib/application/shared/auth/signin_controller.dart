import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/service/auth_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import "package:dashtech/presentation/core/utils/snack_bar_utils.dart";
import 'package:dashtech/presentation/pages/shared/auth/widgets/sign_in_intranet_webview.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import "package:flutter/material.dart";
import 'package:flutter_form_builder/flutter_form_builder.dart';
import "package:get/get.dart";
import "package:get/state_manager.dart";

class SigninController extends GetxController {
  final StorageService storageService = Get.find();
  final IAuthRepository authRepository = Get.find();
  final AuthService authService = Get.find();

  final GlobalKey<FormBuilderState> signInForm = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> signInCodeForm = GlobalKey<FormBuilderState>();

  final RxBool isLoading = false.obs;
  final RxBool isWaitingForCode = false.obs;
  final RxBool verificationCodeFormIsValid = false.obs;
  final RxBool verificationCodeIsValid = false.obs;

  final TextEditingController emailTextController = TextEditingController();

  late List<FocusNode> focusNodes;
  late List<TextEditingController> codes;
  late Worker codeWorker;

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

    super.onClose();
  }

  // Send email code by email
  Future<void> sendEmailCode() async {
    isLoading.value = true;
    final failureOrYes = await authRepository.sendEmailCode(emailTextController.text.toLowerCase());

    failureOrYes.fold(
      (left) => SnackBarUtils.error(message: 'http_common'),
      (right) {
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

    final failureOrAuthProfile =
        await authRepository.confirmEmailCode(emailTextController.text.toLowerCase(), code);
    failureOrAuthProfile.fold(
      (left) {
        isLoading.value = false;
        left.map(
          unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
          notFound: (_) => SnackBarUtils.error(message: 'http_profile_not_found'),
          conflict: (_) => SnackBarUtils.error(message: 'http_profile_invalid_code'),
          unauthorized: (_) => SnackBarUtils.error(message: 'http_profile_expired_code'),
        );
      },
      (right) async {
        isLoading.value = false;
        storageService.box.write('profileId', right.id);
        storageService.box.write('profileEmail', right.email);
        if (right.status == "creating") {
          Get.bottomSheet(
            SingInIntranetWebview(),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          );
          return;
        }

        final failureOrYes = await authRepository.login(right.id, right.email);
        failureOrYes.fold(
          (left) {
            isLoading.value = false;
            left.map(
              unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
              notFound: (_) => SnackBarUtils.error(message: 'http_profile_not_found'),
              conflict: (_) => SnackBarUtils.error(message: 'http_profile_email_missmatch'),
              unauthorized: (_) => SnackBarUtils.error(message: 'http_common'),
            );
          },
          (right) => authService.isIntranetAdmin()
              ? Get.offAllNamed(Routes.admin)
              : Get.offAllNamed(Routes.student),
        );
      },
    );
  }

  void openWebviewBottomSheet() {}

  // Reset the fields
  void resetFields() {
    isWaitingForCode.value = false;
    codes.forEach((controller) => controller.text = '');
    emailTextController.text = '';
  }

  String get code => codes.map((controller) => controller.text).join('');

  void checkFormValidity() {
    verificationCodeFormIsValid.value =
        signInCodeForm.currentState!.mounted && signInCodeForm.currentState!.validate();
  }
}
