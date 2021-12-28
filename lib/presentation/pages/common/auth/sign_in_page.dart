import 'package:dashtech/presentation/common/auth_layout_copy.dart';
import 'package:dashtech/presentation/pages/common/auth/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthLayoutCopy(
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
                child: SigninBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
