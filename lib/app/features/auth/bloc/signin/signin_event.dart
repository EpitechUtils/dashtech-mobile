import 'package:flutter/material.dart';
import 'package:super_enum/super_enum.dart';

part 'signin_event.g.dart';

@superEnum
enum _SigninEvent {
  @Data(fields: [
    DataField<String>('profileName'),
    DataField<String>('autologUrl'),
  ])
  Signin,
  @Data(fields: [
    DataField<String>('profileName'),
    DataField<GlobalKey>('globalKey'),
  ])
  IntranetSignin,
  @Data(fields: [DataField<String>('error')])
  Error,
}
