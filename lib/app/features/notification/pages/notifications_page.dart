import 'package:cached_network_image/cached_network_image.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
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
import 'package:shimmer/shimmer.dart';

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
          error: (e) => _buildContent(context, [], null),
          loaded: (e) => _buildContent(context, e.notifications, e.autologUrl),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<NotificationModel> notifications, String autolog) {
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
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: ClipRRect(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      color: Colors.white,
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 40,
                                width: 40,
                                child: notifications[index].user.picture != null
                                    ? CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: autolog + notifications[index].user.picture,
                                        errorWidget: (context, url, error) =>
                                            Image.asset(AssetsUtils.image('default-user-image')),
                                        placeholder: (context, url) => Shimmer.fromColors(
                                          baseColor: Colors.grey[300],
                                          highlightColor: Colors.grey[200],
                                          child: Container(color: Colors.white),
                                        ),
                                      )
                                    : Image.asset(AssetsUtils.image('default-user-image')),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(TagUtils.removeHtmlTags(notifications[index].title).replaceAll('\\s', " ")),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
