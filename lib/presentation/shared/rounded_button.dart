import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.height,
    this.fontSize,
    this.isRaised = true,
    this.noBorder = false,
    this.isLoading = false,
    this.disabled = false,
  }) : super(key: key);

  final String label;
  final double height;
  final double fontSize;
  final Function onPressed;
  final bool isRaised;
  final bool noBorder;
  final bool isLoading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50,
      width: MediaQuery.of(context).size.width,
      child: isRaised ? _raisedButton(context) : _outlineButton(context),
    );
  }

  Widget _raisedButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: disabled
            ? const LinearGradient(
                colors: [
                  Color(greyColor),
                  Color(greyColor),
                ],
              )
            : const LinearGradient(
                colors: [
                  Color(0xff0652dd),
                  Color(0xff075bf6),
                  Color(0xff1e6bf9),
                ],
              ),
        boxShadow: [
          BoxShadow(
            color: disabled
                ? const Color(greyColor).withOpacity(0.15)
                : const Color(primaryColor).withOpacity(0.35),
            offset: const Offset(2.0, 3.5),
            blurRadius: disabled ? 0 : 1.5,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            if (!isLoading && !disabled) {
              onPressed();
            }
          },
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 27,
                    width: 27,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    label,
                    style: disabled
                        ? const TextStyle(color: Colors.white)
                        : Get.textTheme.button,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _outlineButton(BuildContext context) {
    return OutlineButton(
      onPressed: () => onPressed(),
      textColor: disabled
          ? const Color(inactiveCardTextColor)
          : Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Text(
        isLoading ? 'Loading...' : label,
        textAlign: TextAlign.center,
      ),
    );
  }
}
