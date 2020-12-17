import 'package:flutter_file_store/presentation/pages/auth/sign_up/widgets/sign_up_body.dart';
import 'package:flutter_file_store/presentation/shared/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 70,
                  left: 30,
                  right: 30,
                ),
                child: SignupBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
