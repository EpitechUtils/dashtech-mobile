import 'package:flutter_file_store/presentation/pages/auth/sign_in/widgets/sign_in_body.dart';
import 'package:flutter_file_store/presentation/shared/auth_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class SigninPage extends StatelessWidget {
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
                  left: 30,
                  right: 30,
                ),
                child: SigninBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
