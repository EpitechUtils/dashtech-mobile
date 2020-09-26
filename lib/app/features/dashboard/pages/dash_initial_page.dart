import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/widgets/activities_list_widget.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/tabbar_subheader_widget.dart';
import 'package:flutter/material.dart';

class DashInitialPage extends StatefulWidget {
  final Map<String, List<PlanningActivityModel>> weekActivities;

  DashInitialPage({@required this.weekActivities});

  State<StatefulWidget> createState() => _DashInitialPage();
}

class _DashInitialPage extends State<DashInitialPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarSubHeaderWidget(
          _tabController,
          [Keys.Tabs_Home_Activities, Keys.Tabs_Home_Modules, Keys.Tabs_Home_Projects],
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              ActivitiesListWidget(widget.weekActivities),
              Icon(Icons.movie),
              Icon(Icons.games),
            ],
          ),
        )
      ],
    );
  }
}
