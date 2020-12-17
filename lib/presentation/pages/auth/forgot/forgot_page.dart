import 'package:flutter_file_store/presentation/shared/auth_layout.dart';
import 'package:flutter/material.dart';

class ForgotPage extends StatelessWidget {
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
                padding: const EdgeInsets.only(
                  top: 70,
                  left: 30,
                  right: 30,
                ),
                child: Container(),
              ),
            ),
          );
        },
      ),
    );
  }
}
