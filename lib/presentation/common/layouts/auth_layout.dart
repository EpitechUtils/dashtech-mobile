import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  AuthLayout({required this.child, this.bottomNavigationBar});

  final Widget child;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //appBar: AuthAppBar(context),
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(child: child),
    );
  }
}
