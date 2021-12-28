import 'package:carousel_slider/carousel_slider.dart';
import 'package:dashtech/application/common/onboarding/onboarding_controller.dart';
import 'package:dashtech/application/common/onboarding/widgets/onboarding_carousel_item.dart';
import 'package:dashtech/presentation/common/layouts/auth_layout.dart';
import 'package:dashtech/presentation/common/logo.dart';
import 'package:dashtech/presentation/common/rounded_button.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      bottomNavigationBar: _bottomNavigation(context),
      child: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(bottom: 20, top: 30),
        child: Column(
          children: [
            Logo(),
            Expanded(
              child: CarouselSlider(
                items: _items(),
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  aspectRatio: 1,
                  height: Get.height * 0.4,
                  onPageChanged: (index, reason) {
                    controller.currentIndex(index);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _items().asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      controller.carouselController.animateToPage(entry.key),
                  child: Obx(
                    () => Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(primaryBtnColor).withOpacity(
                            controller.currentIndex() == entry.key ? 1 : 0.4),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _items() {
    return [
      OnboardingCarouselItem(
        svg: 'calendar_sync_icon',
        title: 'Synchronisation de ton planning avec iCal ou Google Calendar',
      ),
      OnboardingCarouselItem(
        svg: 'notification_icon',
        title: 'Notifications avant chaque activites, rendus de projets etc...',
      ),
      OnboardingCarouselItem(
        svg: 'student_card_icon',
        title:
            'Presences directement dans cette application, plus simple, non ?',
      ),
    ];
  }

  Widget _bottomNavigation(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          children: [
            RoundedButton(
              onPressed: () {},
              secondary: true,
              label: 'Associer mon compte',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 100, child: Divider(thickness: 2)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Ou',
                      style: TextStyle(
                        fontFamily: 'Somatic',
                        color: Color(textColor),
                      ),
                    ),
                  ),
                  SizedBox(width: 100, child: Divider(thickness: 2)),
                ],
              ),
            ),
            RoundedButton(
              onPressed: () {},
              label: 'Importer un compte existant',
            ),
          ],
        ),
      ),
    );
  }
}
