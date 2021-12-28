import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({Key? key, this.size = 40}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'm0bi',
        style: TextStyle(
          fontFamily: 'Somatic',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: size,
        ),
        children: const <TextSpan>[
          TextSpan(
            text: 't3ch',
            style: TextStyle(
              color: Color(logoColor),
            ),
          ),
        ],
      ),
    );
  }
}
