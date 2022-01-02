import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  Future<AuthProvider> init() async {
    Logger.write('$runtimeType ready!');
    return this;
  }

  @override
  void onInit() {
    this.baseUrl = dotenv.env['BASE_URL'];
    super.onInit();
  }

  Future<AuthProfileTokenDto> login(String profileId, String email) async {
    final response = await this.post(
      '/auth/login',
      {
        'userId': profileId,
        'email': email,
      },
    );

    return AuthProfileTokenDto.fromJson(response.body);
  }

  Future<AuthProfileTokenDto?> refresh() async {
    try {
      final response = await this.post('/auth/refresh', null);
      return AuthProfileTokenDto.fromJson(response.body);
    } catch (e) {
      return null;
    }
  }
}
