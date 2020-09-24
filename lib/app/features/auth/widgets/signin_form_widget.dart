import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/signin/signin_state.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/use_cases/signin_usecase.dart';
import 'package:epitech_intranet_mobile/app/shared/validators/custom_form_validators.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/delayed_animation_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/rounded_button_widget.dart';

class SigninFormWidget extends StatefulWidget {
  final String signingUsername;

  const SigninFormWidget({Key key, this.signingUsername}) : super(key: key);

  @override
  _SigninFormWidgetState createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  final GlobalKey<FormBuilderState> _signinForm = GlobalKey<FormBuilderState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return DelayedAnimation(
          delay: 50,
          offset: Offset(3.0, 0),
          child: FormBuilder(
            key: _signinForm,
            autovalidate: _autoValidate,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildProfileTitle(),
                  _buildProfileChoice(),
                  _buildTitle(),
                  _buildForm(),
                  _buildButtonOrLoading(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtonOrLoading() {
    return Padding(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 40),
      child: BlocBuilder<SigninBloc, SigninState>(
        builder: (context, state) => state is SigninLoading
            ? LoadingWidget()
            : RoundedButtonWidget(
                label: translate(Keys.Auth_Signin_Submit).toUpperCase(),
                onPressed: () => _dispatchSignin(context),
                isRaised: true,
                color: Theme.of(context).primaryColor,
              ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.only(bottom: 40, left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormBuilderTextField(
            attribute: 'email',
            initialValue: widget.signingUsername,
            autocorrect: false,
            decoration: InputDecoration(
              labelText: translate(Keys.Auth_Form_Email),
              prefixIcon: Icon(Icons.mail_outline),
            ),
            keyboardType: TextInputType.emailAddress,
            validators: [
              FormBuilderValidators.required(
                errorText: translate(Keys.Forms_Error_Required),
              ),
              FormBuilderValidators.email(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTitle() {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 30),
      child: Text(
        translate(Keys.Auth_Signin_Title_Profile).toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildProfileChoice() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 85),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                AssetsUtils.svg('user'),
                width: MediaQuery.of(context).size.width / 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "Profil vide",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                AssetsUtils.svg('user'),
                width: MediaQuery.of(context).size.width / 5,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  "Profil vide",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 20, top: 30),
      child: Text(
        translate(Keys.Auth_Signin_Title).toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  void _dispatchSignin(BuildContext context) {
    if (_signinForm.currentState.validate()) {
      BlocProvider.of<SigninBloc>(context).add(
        SigninEvent.signin(credentials: Credentials.fromForm(_signinForm)),
      );
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
