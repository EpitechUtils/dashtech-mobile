import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/core/utils/device_utils.dart';
import 'package:epitech_intranet_mobile/app/core/utils/keyboard_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/pages/auth_page.dart';
import 'package:epitech_intranet_mobile/app/features/auth/pages/splash_page.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/pages/dash_week_planning_page.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/pages/main_navigator_page.dart';
import 'package:epitech_intranet_mobile/app/features/profile/bloc/profile/profile_bloc.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:uuid/uuid.dart';

class EpitechIntraMobileApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _EpitechIntraMobileApp();
}

class _EpitechIntraMobileApp extends State<EpitechIntraMobileApp> {
  @override
  Widget build(BuildContext context) {
    LocalizationDelegate localDelegate = LocalizedApp.of(context).delegate;
    getIt<FlutterSecureStorage>().write(key: 'profileId', value: '7b3b4a06-0436-400c-9c92-046665b33507');

    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (BuildContext context) => getIt<AuthBloc>()..add(AuthEvent.appStarted()),
        ),
        BlocProvider<AuthModeBloc>(
          create: (BuildContext context) => getIt<AuthModeBloc>(),
        ),
        BlocProvider<ProfileBloc>(
          create: (BuildContext context) => getIt<ProfileBloc>(),
        ),
        BlocProvider<NavigationBloc>(
          create: (BuildContext context) => getIt<NavigationBloc>(),
        ),
      ],
      child: LocalizationProvider(
        state: LocalizationProvider.of(context).state,
        child: StyledToast(
          movingOnWindowChange: true,
          locale: const Locale('fr', 'FR'),
          child: MaterialApp(
            title: 'ZAYBE',
            theme: _defaultThemeData(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              localDelegate
            ],
            supportedLocales: localDelegate.supportedLocales,
            locale: localDelegate.currentLocale,
            color: Color(0xff2196f3),
            home: GestureDetector(
              onTap: () => KeyboardUtils.hide(context),
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) => state.when(
                  uninitialized: (_) => SplashPage(),
                  authenticated: (_) => MainNavigatorPage(),
                  unAuthenticated: (_) => AuthPage(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  ThemeData _defaultThemeData() {
    return ThemeData(
      primaryColor: Color(0xff1c54b2),
      fontFamily: "Roboto",
      buttonColor: Color(0xff2196f3),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: new BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: new BorderSide(
            width: 1,
            color: Colors.grey,
          ),
        ),
        errorBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: new BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: new BorderSide(
            width: 1,
            color: Colors.red,
          ),
        ),
      ),
      textTheme: TextTheme(
        subtitle: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}
