import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();

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
