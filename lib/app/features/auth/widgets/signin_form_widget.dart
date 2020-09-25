import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
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
import 'package:epitech_intranet_mobile/app/shared/widgets/delayed_animation_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/rounded_button_widget.dart';

class SigninFormWidget extends StatefulWidget {
  final List<ProfileModel> profiles;

  const SigninFormWidget({Key key, this.profiles}) : super(key: key);

  @override
  _SigninFormWidgetState createState() => _SigninFormWidgetState();
}

class _SigninFormWidgetState extends State<SigninFormWidget> {
  final GlobalKey<FormBuilderState> _signinForm = GlobalKey<FormBuilderState>();
  final GlobalKey _globalKey = GlobalKey();
  bool _autoValidate = false;
  String _selectedProfile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: _globalKey,
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
        builder: (context, state) => RoundedButtonWidget(
          loading: state is SigninLoading,
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
            attribute: 'profile_name',
            autocorrect: true,
            decoration: InputDecoration(
              labelText: translate(Keys.Auth_Form_Profile_Name),
              prefixIcon: Icon(Icons.person_pin),
            ),
            keyboardType: TextInputType.text,
            validators: [
              FormBuilderValidators.required(
                errorText: translate(Keys.Forms_Error_Required),
              ),
              FormBuilderValidators.maxLength(
                20,
                errorText: translate(
                  Keys.Forms_Error_Maxlength,
                  args: {'maxLength': '20'},
                ),
              )
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
        children: _buildProfilesItems(),
      ),
    );
  }

  List<Widget> _buildProfilesItems() {
    Widget emptyProfile;
    Function toggleProfile = (id) => () {
          this.setState(() {
            _selectedProfile = id;
          });
        };

    if (widget.profiles.isEmpty) {
      return ["empty1", "empty2"].map((id) {
        return _buildSingleProfileItem(toggleProfile(id), "Profil vide", id);
      }).toList();
    } else if (widget.profiles.length == 1) {
      emptyProfile = _buildSingleProfileItem(toggleProfile('empty2'), "Profil vide", 'empty2');
    }

    List<Widget> profilesList = widget.profiles.map((ProfileModel profile) {
      return _buildSingleProfileItem(toggleProfile(profile.id), profile.profileName, profile.id);
    }).toList();
    profilesList.add(emptyProfile);
    return profilesList;
  }

  Widget _buildSingleProfileItem(VoidCallback callback, String name, String id, {String avatarUrl = null}) {
    if (_selectedProfile == id) {
      print(id);
    }

    // TODO: See selection
    return GestureDetector(
      onTap: callback,
      child: Column(
        children: [
          SvgPicture.asset(
            AssetsUtils.svg(_selectedProfile == id ? 'user_selected' : 'user'),
            width: MediaQuery.of(context).size.width / 5,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          )
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
        SigninEvent.intranetSignin(
          globalKey: _globalKey,
          profileName: _signinForm.currentState.fields['profile_name'].currentState.value.toString(),
        ),
      );
    } else {
      setState(() => _autoValidate = true);
    }
  }
}
