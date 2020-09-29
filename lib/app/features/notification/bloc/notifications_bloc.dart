import 'package:epitech_intranet_mobile/app/core/localization/keys.dart';
import 'package:epitech_intranet_mobile/app/core/utils/toast_utils.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_event.dart';
import 'package:epitech_intranet_mobile/app/features/notification/bloc/notifications_state.dart';
import 'package:epitech_intranet_mobile/app/features/notification/business/use_cases/find_notifications_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_event.dart';
import 'package:epitech_intranet_mobile/app/features/setting/bloc/settings_state.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/use_cases/find_settings_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/setting/business/use_cases/update_settings_usecase.dart';
import 'package:epitech_intranet_mobile/app/features/setting/models/setting_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FindNotificationsUseCase findNotificationsUseCase;

  NotificationsBloc({this.findNotificationsUseCase}) : super(NotificationsState.init());

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    yield* event.when(
      loadNotifications: (e) => _mapLoadSettingsToState(e),
    );
  }

  Stream<NotificationsState> _mapLoadSettingsToState(LoadNotifications event) async* {
    yield NotificationsState.loading();
    try {
      List<NotificationModel> notifications = await findNotificationsUseCase();
      yield NotificationsState.loaded(notifications: notifications);
    } catch (err) {
      ToastUtils.error(translate(Keys.Httperror_Internal));
      yield NotificationsState.error();
    }
  }
}
