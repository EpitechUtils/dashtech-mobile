import 'package:dashtech/infrastructure/core/provider/auth_provider.connect.dart';
import 'package:dashtech/infrastructure/core/provider/intranet_provider.connect.dart';
import 'package:dashtech/infrastructure/core/service/auth_service.dart';
import 'package:dashtech/infrastructure/core/service/firebase_service.dart';
import 'package:dashtech/infrastructure/core/service/graphql_service.dart';
import 'package:dashtech/infrastructure/core/service/storage_service.dart';
import 'package:dashtech/presentation/app_widget.dart';
import 'package:dashtech/presentation/core/utils/logger_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(
    fileName: 'assets/.env.qa',
    mergeWith: {'FLAVOR': 'QA'},
  );
  await _initServices();
  runApp(AppWidget());
}

Future<void> _initServices() async {
  Logger.write('Starting services...');
  await GetStorage.init();
  await Firebase.initializeApp();
  await Get.putAsync(() => AuthProvider().init());
  await Get.putAsync(() => IntranetProvider().init());
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => FirebaseService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => GraphqlService().init());
  Logger.write('All services started...');
}
