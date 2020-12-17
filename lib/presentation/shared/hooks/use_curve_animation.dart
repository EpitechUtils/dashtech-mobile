import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<double> useCurve(
  AnimationController animationController,
) =>
    use(
      _CurvedAnimationForAnimationHook(
        animationController: animationController,
      ),
    );

class _CurvedAnimationForAnimationHook extends Hook<Animation<double>> {
  const _CurvedAnimationForAnimationHook({
    @required this.animationController,
  });

  final AnimationController animationController;

  @override
  _CurvedForAnimationHookState createState() => _CurvedForAnimationHookState();
}

class _CurvedForAnimationHookState
    extends HookState<Animation<double>, _CurvedAnimationForAnimationHook> {
  CurvedAnimation _curve;
  Animation<double> _animation;

  @override
  void initHook() {
    _curve = CurvedAnimation(
      parent: hook.animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_curve);

    Future<void>.delayed(
      const Duration(seconds: 1),
      () => hook.animationController.forward(),
    );
  }

  @override
  Animation<double> build(BuildContext context) => _animation;

  @override
  void dispose() => {};
}
