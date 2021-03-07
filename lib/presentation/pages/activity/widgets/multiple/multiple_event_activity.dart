import 'package:dashtech/application/activity/multiple_event_activity_controller.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/activity/widgets/appointment/appointment_details.dart';
import 'package:dashtech/presentation/pages/activity/widgets/appointment/available_slots_list.dart';
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
      length: controller.activityController.activity.value.events.length +
          (controller.activityController.isAppointment ? 1 : 0),
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
              tabs: <Tab>[
                if (controller.activityController.isAppointment)
                  Tab(text: 'global_info'.tr),
                ...controller.activityController.activity.value.events.map(
                  (ActivityDetailsEvent event) => Tab(
                    text: controller.parseDateWithHm(event),
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 50),
          child: Obx(
            () => Visibility(
              visible: controller.activityController.isAppointment &&
                  controller.currentTabIndex.value == 0,
              child: AppointmentDetails(),
              replacement: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CurrentEventTopCard(),
                    Visibility(
                      visible: controller.activityController.isAppointment,
                      child: Obx(
                        () => AvailableSlotsList(
                          event: controller.selectedEvent.value,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
