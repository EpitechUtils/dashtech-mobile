import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_event.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_state.dart';
import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:epitech_intranet_mobile/app/shared/utils/tag_utils.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/loading_widget.dart';
import 'package:epitech_intranet_mobile/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NotificationsPage extends StatelessWidget {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

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
          error: (e) => _buildContent(context, []),
          loaded: (e) => _buildContent(context, e.notifications),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<NotificationModel> notifications) {
    return SmartRefresher(
      onRefresh: () {
        BlocProvider.of<NotificationsBloc>(context)
            .add(NotificationsEvent.refresh(refreshController: _refreshController));
      },
      controller: _refreshController,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 130, top: 20),
        itemCount: notifications.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 100),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: ListTile(
                  enabled: true,
                  title: Text(TagUtils.removeHtmlTags(notifications[index].title)),
                  leading: Icon(Icons.notifications_active),
                  onTap: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
