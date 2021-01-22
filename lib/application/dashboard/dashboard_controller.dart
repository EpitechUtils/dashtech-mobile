import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  DashboardController({@required this.storageService});

  final StorageService storageService;

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
