import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_event.dart';
import 'package:epitech_intranet_mobile/app/features/planning/bloc/planning_state.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlanningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlanningBloc>(
      create: (BuildContext context) => getIt<PlanningBloc>(),
      child: BlocBuilder<PlanningBloc, PlanningState>(
        builder: (context, state) => state.when(
          init: (e) {
            BlocProvider.of<PlanningBloc>(context).add(PlanningEvent.listActivities());
            return LoadingWidget();
          },
          loading: (e) => LoadingWidget(),
          activitiesList: (e) => _buildContent(e),
        ),
      ),
    );
  }

  Widget _buildContent(ActivitiesList event) {
    return Container();
  }
}
