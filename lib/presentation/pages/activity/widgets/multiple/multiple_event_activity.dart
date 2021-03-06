import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/application/activity/multiple_event_activity_controller.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/activity/widgets/multiple/current_event_top_card.dart';
import 'package:dashtech/presentation/pages/activity/widgets/shared/activity_details_base_app_bar.dart';
import 'package:dashtech/presentation/shared/bubble_tab_indicator.dart';
import 'package:dashtech/presentation/shared/colored_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MultipleEventActivity extends GetView<MultipleEventActivityController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.activityController.activity.value.events.length,
      initialIndex: controller.currentTabIndex.value,
      child: Scaffold(
        appBar: ActivityDetailsBaseAppBar(
          bottom: ColoredTabBar(
            color: Colors.white,
            tabBar: TabBar(
              onTap: (int newIndex) {
                controller.currentTabIndex.value = newIndex;
              },
              unselectedLabelColor: const Color(textColor),
              labelColor: Colors.white,
              indicator: const BubbleTabIndicator(
                indicatorHeight: 22,
                indicatorColor: Color(textColor),
                tabBarIndicatorSize: TabBarIndicatorSize.tab,
              ),
              isScrollable: true,
              labelStyle: Get.textTheme.subtitle1.copyWith(
                fontWeight: FontWeight.bold,
              ),
              tabs: controller.activityController.activity.value.events
                  .map(
                    (ActivityDetailsEvent event) => Tab(
                      text: controller.parseDateByEvent(event),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CurrentEventTopCard(),
            ],
          ),
        ),
      ),
    );
  }
}
