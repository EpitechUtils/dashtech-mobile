import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/shared/cached_circle_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityAssistantsList extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Professeurs",
          style: Get.textTheme.headline1.copyWith(),
        ),
        const SizedBox(height: 10),
        Row(
          children: controller.activity.value.events[0].assistants
              .map(
                (ActivityDetailsEventAssistant ass) => Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Tooltip(
                    message: ass.title == null ? "Inconnu" : ass.title,
                    child: Obx(
                      () => Visibility(
                        visible: controller.assistantIcon[ass.login] != null,
                        child: CachedCircleAvatar(
                          noPicture: Image.asset(
                            "assets/images/icons/nopicture-icon.png",
                            width: 40,
                          ),
                          imagePath: controller.assistantIcon[ass.login],
                          radius: 40,
                        ),
                        replacement: SizedBox(height: 40),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
