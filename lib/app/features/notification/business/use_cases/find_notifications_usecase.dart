import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/notification/business/data_sources/notifications_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/notification/models/notification_model.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FindNotificationsUseCase implements UseCase<List<NotificationModel>> {
  final NotificationsDataSource dataSource;

  FindNotificationsUseCase(this.dataSource);

  @override
  Future<List<NotificationModel>> call() async => dataSource.findNotifications();
}
