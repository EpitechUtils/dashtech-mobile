import 'package:dashtech/application/student/dashboard/student_dashboard_controller.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PlanningActivityCard extends StatelessWidget {
  PlanningActivityCard({required this.activity, required this.index});

  final PlanningWeekActivities$Query$PlanningWeekActivity$PlanningActivity activity;
  final int index;
  final StudentDashboardController dashboardController = Get.find();

  void goToActivityDetails(
          PlanningWeekActivities$Query$PlanningWeekActivity$PlanningActivity activity) =>
      Get.toNamed(
        Routes.activityDetails,
        arguments: {
          'scolarYear': activity.scolaryear,
          'codeModule': activity.codemodule,
          'codeInstance': activity.codeinstance,
          'codeActi': activity.codeacti
        },
      );

  @override
  Widget build(BuildContext context) {
    DateFormat hourFormat = DateFormat.Hm(Get.locale!.toLanguageTag());

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Slidable(
        actionPane: SlidableBehindActionPane(),
        secondaryActions: [
          FlatButton(
            color: Colors.white,
            shape: CircleBorder(),
            padding: EdgeInsets.zero,
            height: 50,
            splashColor: Color(greyColor).withOpacity(0.2),
            onPressed: () {},
            child: Icon(
              activity.eventRegistered != "false" ? Icons.close : Icons.add,
              color: activity.eventRegistered != "false" ? Colors.red : Colors.green,
            ),
          ),
        ],
        child: FlatButton(
          color: Colors.white,
          padding: EdgeInsets.zero,
          splashColor: Color(greyColor).withOpacity(0.2),
          onPressed: () {
            goToActivityDetails(activity);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 80,
              child: Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 5,
                    color: ActivityColorUtils.getColorByEventType(
                      activity.typeCode!,
                    ).withOpacity(
                      activity.eventRegistered != "false" ? 1 : 0.6,
                    ),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            hourFormat.format(DateTime.parse(activity.start!)),
                            style: TextStyle(
                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 5),
                          Text(
                            hourFormat.format(DateTime.parse(activity.end!)),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activity.actiTitle!.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: activity.eventRegistered != "false"
                                      ? Colors.black
                                      : Colors.grey,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                activity.titlemodule!.toUpperCase(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300, fontSize: 12, color: Colors.grey),
                              )
                            ],
                          ),
                          Text(
                            activity.room!.code.split('/').last +
                                " (" +
                                activity.totalStudentsRegistered.toString() +
                                "/" +
                                activity.room!.seats.toString() +
                                ")",
                            style: TextStyle(
                              color: ActivityColorUtils.getColorByEventType(
                                activity.typeCode!,
                              ).withOpacity(
                                activity.eventRegistered != "false" ? 1 : 0.6,
                              ),
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
