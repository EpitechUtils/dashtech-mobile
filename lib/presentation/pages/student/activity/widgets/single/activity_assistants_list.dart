import 'package:dashtech/application/student/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/shared/cached_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityAssistantsList extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.activity.value!.events[0].assistants.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'assistants'.tr,
            style: Get.textTheme.headline1!.copyWith(),
          ),
          Text(
            'assistants_subtitle'.tr,
            style: Get.textTheme.headline2,
          ),
          const SizedBox(height: 10),
          ...controller.activity.value!.events[0].assistants
              .map(
                (ActivityDetailsEventAssistant ass) => Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: Get.width - 20,
                    child: Tooltip(
                      message: ass.title,
                      child: Row(
                        children: [
                          CachedCircleAvatar(
                            noPicture: Image.asset(
                              AssetsUtils.image('unknown', FileFormat.jpg),
                              width: 40,
                            ),
                            imagePath: AssetsUtils.profilePicture(
                                ass.login.split('@').first),
                            radius: 40,
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ass.title,
                                style: Get.textTheme.headline1!.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                ass.login,
                                style: Get.textTheme.headline2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
