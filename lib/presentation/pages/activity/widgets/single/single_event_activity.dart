import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/activity/widgets/appointment/available_slots_list.dart';
import 'package:dashtech/presentation/pages/activity/widgets/shared/activity_details_base_app_bar.dart';
import 'package:dashtech/presentation/pages/activity/widgets/single/activity_assistants_list.dart';
import 'package:dashtech/presentation/pages/activity/widgets/single/activity_top_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleEventActivity extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ActivityDetailsBaseAppBar(
        actions: [
          Obx(
            () => Visibility(
              visible: !controller.isLoading.value,
              child: IconButton(
                icon: Icon(
                  controller.isStudentRegistered() ? Icons.close : Icons.add,
                  color: Color(
                    controller.isStudentRegistered()
                        ? errorColor
                        : successColor,
                  ),
                ),
                iconSize: 30,
                splashRadius: 20,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ActivityTopCard(),
              Visibility(
                visible: controller.activity.value.description != null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'description'.tr,
                      style: Get.textTheme.headline1.copyWith(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.activity.value.description != null
                          ? controller.activity.value.description
                          : "",
                      style: Get.textTheme.headline2.copyWith(
                        color: Color(textColor),
                      ),
                    )
                  ],
                ),
              ),
              ActivityAssistantsList(),
              Visibility(
                visible: controller.isAppointment,
                child: AvailableSlotsList(
                  event: controller.activity.value.events.first,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}