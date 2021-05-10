import 'package:dashtech/infrastructure/core/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboardController extends GetxController
    with SingleGetTickerProviderMixin {
  final StorageService storageService = Get.find();

  late TabController tabController;

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
