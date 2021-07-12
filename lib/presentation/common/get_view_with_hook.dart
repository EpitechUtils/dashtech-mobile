import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

abstract class GetViewWithHook<T> extends HookWidget {
  const GetViewWithHook({Key? key}) : super(key: key);

  T get controller => GetInstance().find<T>();

  @override
  Widget build(BuildContext context);
}
