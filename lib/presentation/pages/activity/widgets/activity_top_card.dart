import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ActivityTopCard extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xFF464646).withOpacity(0.2),
            blurRadius: 15.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          width: Get.width - 20,
          color: ActivityColorUtils.getColorByEventType(
              controller.activity.value.type_code),
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
                          LineIcons.hand_stop_o,
                          color: Color(
                            controller.getStudentStatus() == "present"
                                ? successColor
                                : warnColor,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      controller.activity.value.module_title +
                          "\n" +
                          controller.activity.value.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
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
                          controller.parseActivityTime(
                              controller.activity.value.events[0].begin),
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
                          controller.parseActivityTime(
                              controller.activity.value.events[0].end),
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
      ),
    );
  }
}
