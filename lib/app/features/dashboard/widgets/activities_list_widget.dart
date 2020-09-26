import 'package:basic_utils/basic_utils.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:epitech_intranet_mobile/app/shared/utils/activity_color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivitiesListWidget extends StatelessWidget {
  final Map<String, List<PlanningActivityModel>> weekActivities;

  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  ActivitiesListWidget(this.weekActivities);

  @override
  Widget build(BuildContext context) {
    if (weekActivities == null || weekActivities.isEmpty) {
      return Text("error or empty");
    }

    return AnimationLimiter(
      child: ListView.builder(
        itemCount: weekActivities.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDateActivity(ctxt, weekActivities.keys.toList()[index]),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: weekActivities[weekActivities.keys.toList()[index]].length,
                  itemBuilder: (BuildContext ctxt2, int index2) {
                    return AnimationConfiguration.staggeredList(
                      position: index2,
                      duration: const Duration(milliseconds: 400),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: _buildCard(ctxt2, weekActivities[weekActivities.keys.toList()[index]][index2]),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _buildDateActivity(BuildContext ctxt, String date) {
    DateFormat format = DateFormat.EEEE('fr_FR');
    DateFormat formatDate = DateFormat.yMMMd('fr_FR');

    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringUtils.capitalize(format.format(DateTime.parse(date))),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(ctxt).primaryColor,
            ),
          ),
          Text(
            formatDate.format(DateTime.parse(date)),
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _buildCard(BuildContext context, PlanningActivityModel activity) {
    DateFormat hourFormat = DateFormat.Hm('fr_FR');

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 80,
          decoration: BoxDecoration(color: Colors.white),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 5,
                decoration: BoxDecoration(
                  color: ActivityColorUtils.getColorByEventType(activity.type_code),
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        hourFormat.format(DateTime.parse(activity.start)),
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      Text(
                        hourFormat.format(DateTime.parse(activity.end)),
                        style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
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
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          SizedBox(height: 2),
                          Text(
                            activity.titlemodule.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: Colors.grey),
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
                          color: ActivityColorUtils.getColorByEventType(activity.type_code),
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.keyboard_arrow_down),
                color: Colors.grey,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
