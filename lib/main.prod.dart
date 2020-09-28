import 'package:epitech_intranet_mobile/injection.dart';
import 'package:epitech_intranet_mobile/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_translate/flutter_translate.dart';

void main() async {
  await DotEnv().load('assets/.env.prod');
  configureInjection();
  final LocalizationDelegate delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['fr', 'en'],
  );
  runApp(LocalizedApp(delegate, EpitechIntraMobileApp()));
}
