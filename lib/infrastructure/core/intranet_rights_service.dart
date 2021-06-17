import 'package:dashtech/domain/auth/models/intranet_rights.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:get/get.dart';

class IntranetRightsService extends GetxService {
  final StorageService storageService = Get.find();

  Future<IntranetRightsService> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  bool canManageAttendances() {
    List<dynamic>? rights = storageService.box.read<List<dynamic>>('rights');
    if (rights == null) return false;
    bool authorize = false;
    List<String> userRights = List<String>.from(rights);
    userRights.forEach((e) {
      if (EnumToString.convertToString(IntranetRight.global) != e) authorize = true;
    });

    return authorize;
  }
}
