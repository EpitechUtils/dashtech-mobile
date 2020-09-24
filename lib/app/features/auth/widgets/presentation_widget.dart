import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_event.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/delayed_animation_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/rounded_button_widget.dart';

class PresentationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: DelayedAnimation(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Carousel(
                  images: [
                    _buildCarouselItem(
                      context,
                      'synchronize',
                      translate(Keys.Auth_Carousel_First_Title).toUpperCase(),
                      translate(Keys.Auth_Carousel_First_Text),
                    ),
                    _buildCarouselItem(
                      context,
                      'team',
                      translate(Keys.Auth_Carousel_Second_Title).toUpperCase(),
                      translate(Keys.Auth_Carousel_Second_Text),
                    ),
                    _buildCarouselItem(
                      context,
                      'calendar',
                      translate(Keys.Auth_Carousel_Third_Title).toUpperCase(),
                      translate(Keys.Auth_Carousel_Third_Text),
                    ),
                    _buildCarouselItem(
                      context,
                      'shield',
                      translate(Keys.Auth_Carousel_Fourth_Title).toUpperCase(),
                      translate(Keys.Auth_Carousel_Fourth_Text),
                    ),
                  ],
                  autoplay: true,
                  autoplayDuration: Duration(milliseconds: 7000),
                  animationDuration: Duration(milliseconds: 1300),
                  dotPosition: DotPosition.bottomCenter,
                  dotIncreasedColor: Color(0xFF131313),
                  dotColor: Color(0xFF131313).withOpacity(0.4),
                  dotBgColor: Colors.transparent,
                  dotSize: 8,
                  dotIncreaseSize: 1.05,
                  dotSpacing: 18,
                  noRadiusForIndicator: true,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Column(
                  children: <Widget>[
                    RoundedButtonWidget(
                      label: translate(Keys.Auth_Signin_Title).toUpperCase(),
                      onPressed: () => _dispatchShowSigninForm(context),
                      isRaised: true,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildCarouselItem(BuildContext context, String imgName, String title, String message) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SvgPicture.asset(
            AssetsUtils.svg(imgName),
            height: 250,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Color(0xFF131313),
            ),
          ),
        )
      ],
    );
  }

  void _dispatchShowSigninForm(BuildContext context) => BlocProvider.of<AuthModeBloc>(context).add(
        AuthModeEvent.showSigninForm(),
      );
}
