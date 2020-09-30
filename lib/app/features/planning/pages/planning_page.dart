import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_event.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_state.dart';
import 'package:epitech_intranet_mobile/app/features/planning/widgets/day_view_widget.dart';
import 'package:epitech_intranet_mobile/app/features/planning/widgets/month_view_widget.dart';
import 'package:epitech_intranet_mobile/app/features/planning/widgets/week_view_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/tabbar_subheader_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PlanningPage extends StatefulWidget {
  State<StatefulWidget> createState() => _PlanningPage();
}

class _PlanningPage extends State<PlanningPage> with SingleTickerProviderStateMixin {
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
    return BlocProvider<PlanningBloc>(
      create: (BuildContext context) => getIt<PlanningBloc>(),
      child: Column(
        children: [
          AnimationConfiguration.synchronized(
            child: FadeInAnimation(
              child: TabBarSubHeaderWidget(
                _tabController,
                [
                  Keys.Planning_Tabs_Today,
                  Keys.Planning_Tabs_Week,
                  Keys.Planning_Tabs_Month,
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<PlanningBloc, PlanningState>(
              builder: (context, state) => state.when(
                init: (e) {
                  BlocProvider.of<PlanningBloc>(context).add(PlanningEvent.listMonthActivities());
                  return LoadingWidget();
                },
                loading: (e) => TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    LoadingWidget(),
                    LoadingWidget(),
                    LoadingWidget(),
                  ],
                ),
                activitiesList: (e) => TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    DayViewWidget(e.activities),
                    WeekViewWidget(e.activities),
                    MonthViewWidget(e.activities),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
