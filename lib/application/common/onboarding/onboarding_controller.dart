import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final CarouselController carouselController = CarouselController();
}
