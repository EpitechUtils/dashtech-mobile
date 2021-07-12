import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class IntranetProvider extends GetConnect {
  @override
  void onInit() {
    this.baseUrl = "https://intra.epitech.eu";
    this.followRedirects = true;
    this.timeout = Duration(seconds: 2);

    super.onInit();
  }

  Future<String> getOfficeURI() async {
    final response = await this.get("/admin/autolog?format=json");

    dynamic body = response.body;
    if (body == null || response.statusCode! >= 500 || response.body['office_auth_uri'] == null) {
      return "";
    }
    return body['office_auth_uri'];
  }
}
