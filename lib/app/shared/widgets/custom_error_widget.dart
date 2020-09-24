import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:line_icons/line_icons.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';

class CustomErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(LineIcons.warning, color: Colors.red, size: 100),
          SizedBox(height: 10),
          Text(
            translate(Keys.Httperror_General).toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ));
  }
}
