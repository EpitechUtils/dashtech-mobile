import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class CodeField extends StatelessWidget {
  CodeField({
    @required this.focusNode,
    @required this.controller,
    this.nextFocusNode,
    this.fieldWidth = 28,
    this.fieldHeight = 48,
    this.fontSize = 18,
  });

  TextEditingController controller;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  double fieldWidth;
  double fieldHeight;
  double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: fieldWidth,
      height: fieldHeight,
      child: FormBuilderTextField(
        attribute: controller.toString(),
        focusNode: focusNode,
        onChanged: (value) {
          if (value != '' && !nextFocusNode.isNull) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        style: FontStyles.futuraFont.copyWith(
          fontSize: fontSize,
          fontWeight: FontWeight.w900,
          color: const Color(textColor),
        ),
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          counterText: "",
          errorStyle: TextStyle(height: 0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        autocorrect: false,
        maxLength: 1,
        validators: [
          FormBuilderValidators.required(errorText: 'error_form_required'.tr),
        ],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ),
    );
  }
}
