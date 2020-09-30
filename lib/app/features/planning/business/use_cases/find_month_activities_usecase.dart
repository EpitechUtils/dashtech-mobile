import 'package:epitech_intranet_mobile/app/core/usecases/usecase.dart';
import 'package:epitech_intranet_mobile/app/features/planning/business/data_sources/planning_data_source.dart';
import 'package:epitech_intranet_mobile/app/features/planning/models/planning_activity_model.dart';
import 'package:injectable/injectable.dart';

@injectable
@lazySingleton
class FindMonthActivitiesUseCase implements UseCase<List<PlanningActivityModel>> {
  final PlanningDataSource dataSource;

  FindMonthActivitiesUseCase(this.dataSource);

  @override
  Future<List<PlanningActivityModel>> call() async {
    return dataSource.listMonthActivities();
  }
}