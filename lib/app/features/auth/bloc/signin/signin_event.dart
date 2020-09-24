import 'package:super_enum/super_enum.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signin_usecase.dart';

part 'signin_event.g.dart';

@superEnum
enum _SigninEvent {
  @Data(fields: [
    DataField<Credentials>('credentials'),
  ])
  Signin,
}
