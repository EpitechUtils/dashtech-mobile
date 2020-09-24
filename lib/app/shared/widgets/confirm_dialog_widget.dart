import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/rounded_button_widget.dart';

class ConfirmDialog extends StatefulWidget {
  final Function onContinue;
  final Function onBack;
  final String message;
  final bool showLoading;

  ConfirmDialog({Key key, this.onContinue, this.onBack, this.message, this.showLoading = false});

  @override
  _ConfirmDialogState createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          loading ? LoadingWidget() : _buildButtons()
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        RoundedButtonWidget(
          label: translate(Keys.Actions_Confirm),
          isRaised: true,
          color: Colors.red,
          onPressed: () {
            if (widget.showLoading) {
              setState(() => loading = true);
            }
            this.widget.onContinue();
          },
        ),
        SizedBox(
          height: 10,
        ),
        RoundedButtonWidget(
          label: translate(Keys.Actions_Cancel),
          isRaised: false,
          color: Colors.red,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
