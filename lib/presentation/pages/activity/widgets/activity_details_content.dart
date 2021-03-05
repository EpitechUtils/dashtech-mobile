import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/presentation/pages/activity/widgets/activity_top_card.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:dashtech/presentation/shared/auth_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

class ActivityDetailsContent extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ActivityTopCard(),
        const SizedBox(height: 15),
        Visibility(
          visible: controller.activity.value.description != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Description",
                style: Get.textTheme.headline1.copyWith(),
              ),
              const SizedBox(height: 5),
              Text(
                controller.activity.value.description != null
                    ? controller.activity.value.description
                    : "",
                style: Get.textTheme.headline2,
              )
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.only(left: 15, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Container(
                  child: Text(
                    "Professeurs",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child:
                    /*Row(
                  children: () {
                    List<Widget> professors = List<Widget>();

                    this
                        ._scheduleSession
                        .professors
                        .forEach((ScheduleProfessor prof) {
                      professors.add(Container(
                          padding: EdgeInsets.only(right: 15),
                          child: Tooltip(
                              message:
                                  prof.title == null ? "Inconnu !" : prof.title,
                              child: CustomCircleAvatar(
                                noPicture: Image.asset(
                                    "assets/images/icons/nopicture-icon.png",
                                    width: 60),
                                imagePath: this._autolog +
                                    "/file/userprofil/" +
                                    prof.login.split('@')[0] +
                                    ".bmp",
                                radius: 60,
                              ))));
                    });

                    return professors;
                  }(),
                )*/
                    Container(),
              ),
            ],
          ),
        ),

        // Details of registered users
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: FlatButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            onPressed: () {},
            color: (controller.activity.value.register == "0")
                ? Color(0xFF4CAF50)
                : Color(0xFFf44336),
            child: Container(
              margin: const EdgeInsets.only(top: 3),
              child: Text(
                (controller.activity.value.register == "0")
                    ? "S'inscrire"
                    : "Se désinscrire",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Sabrun",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
