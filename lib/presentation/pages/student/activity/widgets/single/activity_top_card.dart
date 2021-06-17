import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ActivityTopCard extends GetView<StudentActivityController> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: ActivityColorUtils.getColorByEventType(
        controller.activity.value!.type_code,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: Container(
        width: Get.width - 20,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Visibility(
                    visible: controller.getStudentStatus() != null,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Icon(
                        LineIcons.handPointingUp,
                        color: Color(
                          controller.getStudentStatus() == "present" ? successColor : warnColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.activity.value!.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Obx(
                          () => Text(
                            StringUtils.capitalize(controller.parseDate()),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
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
                        controller.parseActivityTime(controller.activity.value!.events[0].begin),
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
                        controller.parseActivityTime(controller.activity.value!.events[0].end),
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
                  controller.parseActivityRoom(),
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
    );
  }
}
