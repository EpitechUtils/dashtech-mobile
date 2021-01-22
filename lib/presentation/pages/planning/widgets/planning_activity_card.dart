import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/activities_controller.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PlanningActivityCard extends StatelessWidget {
  PlanningActivityCard({@required this.activity, @required this.index});

  final PlanningActivity activity;
  final int index;
  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    DateFormat hourFormat = DateFormat.Hm(Get.locale.toLanguageTag());

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Slidable(
          actionPane: SlidableBehindActionPane(),
          secondaryActions: [
            IconSlideAction(
              caption: activity.event_registered == "registered"
                  ? "unregister"
                  : "register",
              color: activity.event_registered == "registered"
                  ? Colors.red
                  : Colors.green,
              icon: activity.event_registered == "registered"
                  ? Icons.maximize
                  : Icons.add,
              onTap: () => {
                // TODO: perform
              },
            ),
          ],
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  color: activity.event_registered == "registered"
                      ? ActivityColorUtils.getColorByEventType(
                          activity.type_code)
                      : Colors.grey,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          hourFormat.format(DateTime.parse(activity.start)),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                        Text(
                          hourFormat.format(DateTime.parse(activity.end)),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              activity.acti_title.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: activity.event_registered == "registered"
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              activity.titlemodule.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        Text(
                          activity.room.code.split('/').last +
                              " (" +
                              activity.total_students_registered.toString() +
                              "/" +
                              activity.room.seats.toString() +
                              ")",
                          style: TextStyle(
                            color: activity.event_registered == "registered"
                                ? ActivityColorUtils.getColorByEventType(
                                    activity.type_code)
                                : Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                /*SizedBox(
                width: 30,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: Colors.grey,
                  ),
                ),
              )*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
