import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({
    Key? key,
    this.size = 40,
    this.animated = false,
  }) : super(key: key);

  final double size;
  final bool animated;

  @override
  Widget build(BuildContext context) {
    if (animated) {
      return DefaultTextStyle(
        style: TextStyle(
          fontFamily: 'Somatic',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: size,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              'm0bit3ch',
              speed: Duration(milliseconds: 200),
              textStyle: TextStyle(
                color: Color(logoColor),
              ),
            ),
          ],
          isRepeatingAnimation: true,
        ),
      );
    }

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
