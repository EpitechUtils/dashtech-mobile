import 'package:dashtech/infrastructure/core/firebase_service.dart';
import 'package:dashtech/infrastructure/core/graphql_service.dart';
import 'package:dashtech/infrastructure/core/http_service.dart';
import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:dashtech/infrastructure/core/token_service.dart';
import 'package:dashtech/presentation/app_widget.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  DotEnv().load('assets/.env.prod');
  runApp(AppWidget());
}

Future<void> _initServices() async {
  Logger.write('Starting services...');
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => FirebaseService().init());
  await Get.putAsync(() => TokenService().init());
  await Get.putAsync(() => HttpService().init());
  await Get.putAsync(() => GraphqlService().init());
  Logger.write('All services started...');
}
