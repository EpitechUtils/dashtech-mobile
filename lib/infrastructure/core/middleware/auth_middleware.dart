import 'package:dashtech/infrastructure/core/service/token_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  final TokenService tokenService = Get.find();

  @override
  int get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    final bool isAuth = tokenService.getToken() != null;
    return isAuth ? null : RouteSettings(name: Routes.signin);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    Logger.write("$runtimeType bindings ready");
    return page;
  }
}
