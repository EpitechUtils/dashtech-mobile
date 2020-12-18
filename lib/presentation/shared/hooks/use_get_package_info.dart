import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info/package_info.dart';

PackageInfo useGetPackageInfo() => use(const _PackageInfoHook());

class _PackageInfoHook extends Hook<PackageInfo> {
  const _PackageInfoHook();

  @override
  _PackageInfoHookState createState() => _PackageInfoHookState();
}

class _PackageInfoHookState extends HookState<PackageInfo, _PackageInfoHook> {
  PackageInfo packageInfo;

  @override
  void initHook() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  PackageInfo build(BuildContext context) => packageInfo;

  @override
  void dispose() => {};
}
