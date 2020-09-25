import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/widgets/presentation_widget.dart';
import 'package:epitech_intranet_mobile/app/features/auth/widgets/signin_form_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/delayed_animation_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.transparent);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);

    return Scaffold(
      body: BlocProvider(
        create: (BuildContext context) => getIt<SigninBloc>(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                _buildHeader(context),
                _buildContent(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildContent(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: BlocBuilder<AuthModeBloc, AuthModeState>(
          builder: (context, state) => state.when(
            init: (_) => PresentationWidget(),
            signinMode: (e) => SigninFormWidget(profiles: e.profiles),
          ),
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          DelayedAnimation(
            delay: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<AuthModeBloc, AuthModeState>(
                    builder: (context, state) => state.when(
                      init: (_) => IconButton(
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 100,
                          color: Colors.transparent,
                        ),
                      ),
                      signinMode: (_) => _buildBackAction(context),
                    ),
                  ),
                  SvgPicture.asset(
                    AssetsUtils.svg('logo_line_1'),
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10, width: 50)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackAction(context, [event]) {
    return DelayedAnimation(
      delay: 100,
      child: Container(
        child: IconButton(
          onPressed: () => _dispatchShowInit(context, event),
          splashColor: Colors.white,
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void _dispatchShowInit(BuildContext context, event) {
    if (event.toString().startsWith("Forgot")) {
      BlocProvider.of<AuthModeBloc>(context).add(
        AuthModeEvent.showSigninForm(),
      );
      return;
    }
    BlocProvider.of<AuthModeBloc>(context).add(
      AuthModeEvent.showInit(),
    );
  }
}
