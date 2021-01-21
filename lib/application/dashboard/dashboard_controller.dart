import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController tabController;

  @override
  Future<void> onInit() async {
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
