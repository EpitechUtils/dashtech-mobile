import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_event.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_state.dart';
import 'package:epitech_intranet_mobile/app/features/notification/business/use_cases/find_notifications_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:epitech_intranet_mobile/app/features/profile/business/use_cases/find_profile_autolog_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FindNotificationsUseCase findNotificationsUseCase;
  FindProfileAutologUseCase findProfileAutologUseCase;

  NotificationsBloc({this.findNotificationsUseCase, this.findProfileAutologUseCase}) : super(NotificationsState.init());

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    yield* event.when(
      refresh: (e) => _mapRefreshToState(e),
      loadNotifications: (e) => _mapLoadSettingsToState(e),
    );
  }

  Stream<NotificationsState> _mapLoadSettingsToState(LoadNotifications event) async* {
    yield NotificationsState.loading();
    try {
      List<NotificationModel> notifications = await findNotificationsUseCase();
      String autolog = await findProfileAutologUseCase();
      yield NotificationsState.loaded(notifications: notifications, autologUrl: autolog);
    } catch (err) {
      ToastUtils.error(translate(Keys.Httperror_Internal));
      yield NotificationsState.error();
    }
  }

  Stream<NotificationsState> _mapRefreshToState(Refresh e) async* {
    try {
      List<NotificationModel> notifications = await findNotificationsUseCase();
      String autolog = await findProfileAutologUseCase();
      e.refreshController.refreshCompleted();
      yield NotificationsState.loaded(notifications: notifications, autologUrl: autolog);
    } catch (err) {
      print(err);
      e.refreshController.refreshFailed();
      ToastUtils.error(translate(Keys.Httperror_General));
    }
  }
}
