import 'package:super_enum/super_enum.dart';

part 'signin_state.g.dart';

@superEnum
enum _SigninState {
  @object
  SigninInitial,
  @object
  SigninLoading,
  @object
  SigninError,
}
