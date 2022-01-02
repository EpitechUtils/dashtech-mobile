import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/provider/intranet_provider.connect.dart';
import 'package:dashtech/infrastructure/core/service/auth_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import "package:get/get.dart";
import "package:get/state_manager.dart";

class OnboardingWebviewController extends GetxController {
  final StorageService storageService = Get.find();
  final AuthService authService = Get.find();
  final IAuthRepository authRepository = Get.find();
  final IntranetProvider intranetProvider = Get.find();

  final CookieManager cookieManager = CookieManager.instance();

  final RxBool isSyncing = false.obs;
  final RxDouble progress = 0.0.obs;
  final RxString officeLoginUrl = ''.obs;

  @override
  Future<void> onInit() async {
    officeLoginUrl.value = await intranetProvider.getOfficeURI();
    super.onInit();
  }

  // When progress load of the page change
  void onProgressChanged(InAppWebViewController controller, int val) {
    progress.value = val / 100;
  }

  // When url stop to load
  void onLoadStop(InAppWebViewController controller, Uri? uri) async {
    if (uri.toString().startsWith("https://intra.epitech.eu/admin/autolog")) {
      //Navigator.of(Get.context).pop();

      try {
        Cookie? cookie = await cookieManager.getCookie(
          url: Uri.parse("https://intra.epitech.eu"),
          name: "user",
        );

        print(cookie.toString());
        if (cookie == null) {
          SnackBarUtils.error(message: 'http_profile_login_fail');
          return;
        }
        _performSync(cookie.value);
      } catch (err) {
        SnackBarUtils.error(message: 'http_common');
      }
    }
  }

  // Perform intra and account checks and synchronization
  // TODO: Caching some basic data from intra
  void _performSync(String jwtToken) async {
    isSyncing.value = true;
    final String profileId = storageService.box.read('profileId');

    final failureOrYes =
        await authRepository.linkUserToIntranetProfile(profileId, jwtToken);
    failureOrYes.fold(
      (left) => left.map(
        unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
        notFound: (_) => SnackBarUtils.error(message: 'http_profile_not_found'),
        conflict: (_) =>
            SnackBarUtils.error(message: 'http_profile_email_missmatch'),
        unauthorized: (_) => SnackBarUtils.error(message: 'http_common'),
      ),
      (right) {
        _performLoginFromCurrentProfileId(profileId);
      },
    );
  }

  // Login from current profile id
  void _performLoginFromCurrentProfileId(String profileId) async {
    final String profileEmail = storageService.box.read('profileEmail');
    final failureOrYes = await authRepository.login(profileId, profileEmail);

    failureOrYes.fold(
      (left) => left.map(
        unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
        notFound: (_) => SnackBarUtils.error(message: 'http_profile_not_found'),
        conflict: (_) =>
            SnackBarUtils.error(message: 'http_profile_email_missmatch'),
        unauthorized: (_) => SnackBarUtils.error(message: 'http_common'),
      ),
      (right) => authService.isIntranetAdmin()
          ? Get.offAllNamed(Routes.admin)
          : Get.offAllNamed(Routes.student),
    );
  }
}
