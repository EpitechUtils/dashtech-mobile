import 'package:epitech_intranet_mobile/app/features/auth/models/profile_model.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/business/data_sources/dashboard_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/auth/business/data_sources/auth_data_source.dart';

@injectable
@lazySingleton
class FindWeekActivitiesUseCase implements UseCase<List<PlanningActivityModel>> {
  final DashboardDataSource dataSource;

  FindWeekActivitiesUseCase(this.dataSource);

  @override
  Future<List<PlanningActivityModel>> call() async {
    return dataSource.weekActivities();
  }
}
