import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String label;
  final double height;
  final double fontSize;
  final Function onPressed;
  final bool isRaised;
  final bool noBorder;
  final bool loading;
  final Color color;

  const RoundedButtonWidget({
    Key key,
    this.onPressed,
    this.label,
    this.height,
    this.fontSize,
    this.isRaised,
    this.loading = false,
    this.noBorder = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height != null ? this.height : 50,
      width: MediaQuery.of(context).size.width / 1.5,
      child: this.isRaised ? _raisedButton(context) : _outlineButton(context),
    );
  }

  Widget _raisedButton(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      textColor: Colors.white,
      color: this.color ?? Theme.of(context).primaryColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "ProductSansBold",
            fontSize: this.fontSize != null ? this.fontSize : 16,
          ),
        ),
      ),
    );
  }

  Widget _outlineButton(BuildContext context) {
    return OutlineButton(
      onPressed: this.onPressed,
      textColor: this.color ?? Theme.of(context).primaryColor,
      borderSide: BorderSide(
        color: this.noBorder ? Colors.transparent : this.color ?? Theme.of(context).primaryColor,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Container(
        child: Text(
          this.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: this.fontSize != null ? this.fontSize : 16,
          ),
        ),
      ),
    );
  }

  Widget _textOrLoading() {
    if (loading) {
      return Row(
        children: [
          CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(color)),
          Text(
            this.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: this.fontSize != null ? this.fontSize : 16,
            ),
          ),
        ],
      );
    }

    return Text(
      this.label,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: this.fontSize != null ? this.fontSize : 16,
      ),
    );
  }
}
