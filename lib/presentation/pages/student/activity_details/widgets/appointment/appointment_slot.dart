import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/student/activity/student_appointment_controller.dart';
import 'package:dashtech/presentation/common/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentSlot extends GetView<StudentAppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          "your_appointment_slot".tr,
          style: Get.textTheme.headline1,
        ),
        Text(
          'your_appointment_slot'.tr,
          style: Get.textTheme.headline2,
        ),
        const SizedBox(height: 5),
        Card(
          color: ActivityColorUtils.getColorByEventType("rdv"),
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          child: Container(
            width: Get.width - 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.groupSlot.value!.actiTitle!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Obx(
                        () => Text(
                          StringUtils.capitalize(controller.parseDateOfSlot()),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: Get.width / 2,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            controller.activityController
                                .parseActivityTime(controller.groupSlot.value!.date!),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            controller.activityController.parseActivityTime(
                              controller.groupSlot.value!.date!,
                              addMinutes: controller.groupSlot.value!.duration!.toInt(),
                            ),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      controller.activityController.parseActivityRoom(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
