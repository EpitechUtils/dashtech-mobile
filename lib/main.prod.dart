import 'package:flutter_file_store/infrastructure/core/firebase_service.dart';
import 'package:flutter_file_store/infrastructure/core/graphql_service.dart';
import 'package:flutter_file_store/infrastructure/core/token_service.dart';
import 'package:flutter_file_store/presentation/app_widget.dart';
import 'package:flutter_file_store/presentation/core/utils/logger_utils.dart';
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
  await Get.putAsync(() => TokenService().init());
  await Get.putAsync(() => FirebaseService().init());
  await Get.putAsync(() => GraphqlService().init());
  Logger.write('All services started...');
}
