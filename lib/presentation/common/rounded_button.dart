import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/theme/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.height,
    this.fontSize,
    this.color,
    this.secondary = false,
    this.isLoading = false,
    this.disabled = false,
  }) : super(key: key);

  final Function onPressed;
  final String label;
  final double? height;
  final double? fontSize;
  final Color? color;
  final bool secondary;
  final bool isLoading;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 60,
      width: MediaQuery.of(context).size.width,
      child: _raisedButton(context),
    );
  }

  Widget _raisedButton(BuildContext context) {
    Color btnColor = color ??
        (!secondary ? Color(primaryBtnColor) : Color(secondaryBtnColor));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: btnColor,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          highlightColor: btnColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20.0),
          onTap: () {
            if (!isLoading && !disabled) {
              onPressed();
            }
          },
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    label,
                    textAlign: TextAlign.center,
                    style: disabled
                        ? const TextStyle(color: Colors.white)
                        : (!secondary
                            ? FontStyles.primaryButton
                            : FontStyles.secondaryButton),
                  ),
          ),
        ),
      ),
    );
  }
}
