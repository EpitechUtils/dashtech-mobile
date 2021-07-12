import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/student/activity/student_appointment_controller.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/common/cached_circle_avatar.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentGroup extends GetView<StudentAppointmentController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          "your_group".tr,
          style: Get.textTheme.headline1,
        ),
        Text(
          StringUtils.capitalize(controller.appointmentDetails.value!.group!.title!),
          style: Get.textTheme.headline2,
        ),
        const SizedBox(height: 5),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: Get.width - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CachedCircleAvatar(
                      noPicture: Image.asset(
                        AssetsUtils.image('unknown', FileFormat.jpg),
                        width: 40,
                      ),
                      imagePath: AssetsUtils.profilePicture(
                          controller.appointmentDetails.value!.group!.master),
                      radius: 40,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringUtils.capitalize(
                            controller.appointmentDetails.value!.group!.master!
                                .split('@')
                                .first
                                .split('.')
                                .join(" "),
                            allWords: true,
                          ),
                          style: Get.textTheme.headline1!.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          controller.appointmentDetails.value!.group!.master!,
                          style: Get.textTheme.headline2,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: controller.appointmentDetails.value!.group!.members!.isNotEmpty,
          child: ExpandablePanel(
            header: Container(
              margin: const EdgeInsets.only(top: 5),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'see_other_group_members'.tr,
                style: Get.textTheme.headline2,
              ),
            ),
            collapsed: Container(),
            expanded: Column(
              children: controller.appointmentDetails.value!.group!.members!
                  .map(
                    (String memberLogin) => Card(
                      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: Get.width - 20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CachedCircleAvatar(
                                  noPicture: Image.asset(
                                    AssetsUtils.image('unknown', FileFormat.jpg),
                                    width: 40,
                                  ),
                                  imagePath: AssetsUtils.profilePicture(memberLogin),
                                  radius: 40,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringUtils.capitalize(
                                        memberLogin.split('@').first.split('.').join(" "),
                                        allWords: true,
                                      ),
                                      style: Get.textTheme.headline1!.copyWith(
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      memberLogin,
                                      style: Get.textTheme.headline2,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
