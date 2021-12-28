import 'package:dashtech/presentation/common/logo.dart';
import 'package:flutter/material.dart';

class AuthAppBar extends AppBar {
  AuthAppBar(BuildContext context, {Key? key})
      : super(
          key: key,
          leading: null,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          title: Logo(),
        );

  @override
  Size get preferredSize => Size.fromHeight(50.0);
}
