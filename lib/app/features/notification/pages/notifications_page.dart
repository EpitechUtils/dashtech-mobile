import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_event.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_state.dart';
import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/comming_soon_widget.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotificationsBloc>(
      create: (BuildContext context) => getIt<NotificationsBloc>(),
      child: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) => state.when(
          init: (e) {
            BlocProvider.of<NotificationsBloc>(context).add(NotificationsEvent.loadNotifications());
            return LoadingWidget();
          },
          loading: (e) => LoadingWidget(),
          error: (e) => _buildContent([]),
          loaded: (e) => _buildContent(e.notifications),
        ),
      ),
    );
  }

  Widget _buildContent(List<NotificationModel> notifications) {
    return CommingSoonWidget();
  }
}
