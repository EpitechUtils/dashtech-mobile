import 'package:dashtech/infrastructure/auth/dto/auth_profile_token_dto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class AuthProvider extends GetConnect {
  Future<AuthProfileTokenDto> login(String profileId, String email) async {
    final response = await this.post(
      dotenv.env['BASE_URL']! + '/auth/login',
      {
        'profileId': profileId,
        'email': email,
      },
    );

    return AuthProfileTokenDto.fromJson(response.body);
  }
}
