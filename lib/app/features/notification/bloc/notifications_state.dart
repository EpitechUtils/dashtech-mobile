import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:super_enum/super_enum.dart';

part 'notifications_state.g.dart';

@superEnum
enum _NotificationsState {
  @object
  Init,
  @object
  Loading,
  @object
  Error,
  @Data(fields: [
    DataField<List<NotificationModel>>('notifications'),
    DataField<String>('autologUrl'),
  ])
  Loaded,
}
