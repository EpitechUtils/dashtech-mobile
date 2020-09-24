import 'package:flutter/material.dart';

class CenteredTitleWidget extends StatelessWidget {
  final String title;

  const CenteredTitleWidget(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18,
                fontFamily: "ProductSansBold",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
