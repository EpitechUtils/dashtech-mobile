import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();

  RxInt index = 0.obs;

  @override
  void onClose() {
    pageController.dispose();
  }

  void onPageChanged(int newIndex) {
    index.value = newIndex;
    pageController.jumpToPage(newIndex);
  }
}
