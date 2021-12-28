import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/appointment/available_slots_list.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/common/activity_details_base_app_bar.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/common/additional_options_for_activity_fab.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/single_activity/activity_assistants_list.dart';
import 'package:dashtech/presentation/pages/student/activity_details/widgets/single_activity/activity_top_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleEventActivity extends GetView<StudentActivityController> {
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
      floatingActionButton: AdditionalOptionsForActivityFab(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 50),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ActivityTopCard(),
              const SizedBox(height: 15),
              Obx(
                () => Visibility(
                  visible: controller.getStudentStatus() != null,
                  child: Card(
                    color: Color(
                      controller.getStudentStatus() == "present"
                          ? successColor
                          : warnColor,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 4,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width - 20,
                      child: Text(
                        'your_status_defined_to'.trParams(
                          {
                            'status': controller.getStudentStatus() ?? "",
                          },
                        ),
                        textAlign: TextAlign.center,
                        style: Get.textTheme.headline2!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: controller.activity.value!.description != null ||
                    controller.activity.value!.description!.isNotEmpty,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      'description'.tr,
                      style: Get.textTheme.headline1!.copyWith(),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      controller.activity.value!.description != null
                          ? controller.activity.value!.description!
                          : "",
                      style: Get.textTheme.headline2!.copyWith(
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
                  event: controller.activity.value!.events!.first,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
