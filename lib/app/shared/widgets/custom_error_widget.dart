import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_translate/flutter_translate.dart';

class CustomErrorWidget extends StatelessWidget {
  VoidCallback refresh;

  CustomErrorWidget({this.refresh});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 120),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetsUtils.svg('browser'),
            width: MediaQuery.of(context).size.width / 3,
          ),
          SizedBox(height: 20),
          Text(
            translate(Keys.Toastr_Error).toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              translate(Keys.Httperror_General),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF131313),
              ),
            ),
          ),
          this.refresh != null
              ? Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: RoundedButtonWidget(
                    isRaised: true,
                    onPressed: this.refresh,
                    label: translate(Keys.Actions_Try_Again).toUpperCase(),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
