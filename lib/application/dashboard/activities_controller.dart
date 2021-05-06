import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivitiesController extends GetxController {
  ActivitiesController({required this.planningRepository});

  final IPlanningRepository planningRepository;

  final RxBool showShimmer = false.obs;
  final RxList<PlanningWeekActivity> activities = <PlanningWeekActivity>[].obs;

  late RefreshController refreshController;

  @override
  Future<void> onInit() async {
    showShimmer.value = true;
    refreshController = RefreshController(initialRefresh: false);
    fetchActivities(false);
    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> fetchActivities(bool refresh) async {
    final Either<BaseFailure, List<PlanningWeekActivity>> failureOrActivities =
        await planningRepository.getDashActivitiesList();

    failureOrActivities.fold(
      (BaseFailure left) {
        showShimmer.value = false;
        if (refresh) {
          refreshController.refreshFailed();
          return;
        }

        SnackBarUtils.error(message: 'http_common'.tr);
      },
      (List<PlanningWeekActivity> right) {
        showShimmer.value = false;
        if (refresh) {
          refreshController.refreshCompleted();
        }
        activities.clear();
        activities.addAll(right);
      },
    );
  }
}
