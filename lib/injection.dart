import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection() async {
  $initGetIt(getIt);
}
