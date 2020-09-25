import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';

@injectable
@lazySingleton
class SigninUseCase implements UseCaseWithParams<ProfileModel, Credentials> {
  final AuthDataSource dataSource;

  SigninUseCase(this.dataSource);

  @override
  Future<ProfileModel> call(Credentials credentials) async {
    return dataSource.signin(credentials);
  }
}

class Credentials extends Equatable {
  final String profileName;
  final String autologUrl;
  final String identifier;

  Credentials.fromRaw(this.profileName, this.autologUrl, this.identifier);

  @override
  List<Object> get props => [profileName, autologUrl, identifier];
}
