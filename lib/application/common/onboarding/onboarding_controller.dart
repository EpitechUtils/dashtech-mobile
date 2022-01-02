import 'package:carousel_slider/carousel_controller.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/service/auth_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static final GlobalKey<FormBuilderState> linkForm = GlobalKey();

  final IAuthRepository authRepository = Get.find();
  final StorageService storageService = Get.find();
  final AuthService authService = Get.find();

  final RxInt currentIndex = 0.obs;
  final RxBool isLoading = false.obs;
  final RxBool verificationCodeFormIsValid = false.obs;

  final CarouselController carouselController = CarouselController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  late Worker codeWorker;
  late List<FocusNode> focusNodes;
  late List<TextEditingController> codes;

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }

  /// Send email code by email
  Future<void> sendEmailCode() async {
    isLoading(true);
    final response = await authRepository.sendEmailCode(emailController.text);

    isLoading(false);
    if (response.isLeft()) {
      SnackBarUtils.error(message: 'http_common');
    } else {
      _initEmailCodeVars();
      Get.toNamed(Routes.onboardingEmailCode);
    }
  }

  // Send request to API to validate the verification code previously sent
  void _validateVerificationCode(String code) async {
    isLoading(true);
    final failOrProfile =
        await authRepository.confirmEmailCode(emailController.text, code);

    failOrProfile.fold(
      (left) {
        isLoading(false);
        left.map(
          unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
          notFound: (_) =>
              SnackBarUtils.error(message: 'http_profile_not_found'),
          conflict: (_) =>
              SnackBarUtils.error(message: 'http_profile_invalid_code'),
          unauthorized: (_) =>
              SnackBarUtils.error(message: 'http_profile_expired_code'),
        );
      },
      (right) async {
        storageService.box.write('profileId', right.id);
        storageService.box.write('profileEmail', right.email);
        if (right.status == "creating") {
          Get.toNamed(Routes.signinWebview);
          return;
        }

        final response = await authRepository.login(right.id, right.email);
        isLoading(false);
        response.fold(
          (left) {
            left.map(
              unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
              notFound: (_) =>
                  SnackBarUtils.error(message: 'http_profile_not_found'),
              conflict: (_) =>
                  SnackBarUtils.error(message: 'http_profile_email_missmatch'),
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

  /// Init variables for email code validation
  void _initEmailCodeVars() {
    codes = List.generate(6, (_) => TextEditingController());
    focusNodes = List.generate(6, (_) => FocusNode());
    codeWorker = ever(verificationCodeFormIsValid, (bool isValid) {
      if (!isValid) {
        //_reset();
        return;
      }
      _validateVerificationCode(code);
    });
  }

  String get code => codes.map((controller) => controller.text).join('');
}
