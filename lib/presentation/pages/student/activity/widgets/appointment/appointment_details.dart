import 'package:dashtech/application/student/activity/appointment_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/student/activity/widgets/appointment/appointment_details_shimmer.dart';
import 'package:dashtech/presentation/pages/student/activity/widgets/appointment/appointment_group.dart';
import 'package:dashtech/presentation/pages/student/activity/widgets/appointment/appointment_slot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentDetails extends GetView<AppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isLoading.value,
        child: AppointmentDetailsShimmer(),
        replacement: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Card(
            color: Color(controller.isRegistered ? successColor : errorColor),
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            child: Container(
              padding: const EdgeInsets.all(10),
              width: Get.width - 20,
              child: Text(
                (controller.isRegistered
                        ? "appointment_registered"
                        : "appointment_not_registered")
                    .tr,
                textAlign: TextAlign.center,
                style: Get.textTheme.headline2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          controller.groupSlot.value != null &&
                  controller.groupSlot.value!.code != null
              ? Column(
                  children: [
                    AppointmentSlot(),
                    AppointmentGroup(),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
