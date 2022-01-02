import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class StudentActivitiesController extends GetxController {
  final IPlanningRepository planningRepository = Get.find();

  final RxBool showShimmer = false.obs;

  //final RxList<PlanningListWeekActivities$Query$PlanningWeekActivity> activities = RxList([]);
  final RxList<dynamic> activities = RxList([]);

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
    final failureOrActivities =
        await planningRepository.getDashActivitiesList();

    failureOrActivities.fold(
      (left) {
        showShimmer.value = false;
        if (refresh) {
          refreshController.refreshFailed();
          return;
        }

        SnackBarUtils.error(message: 'http_common'.tr);
      },
      (right) {
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
