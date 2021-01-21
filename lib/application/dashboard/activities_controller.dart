import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivitiesController extends GetxController {
  ActivitiesController({@required this.planningRepository});

  final IPlanningRepository planningRepository;

  final RxBool showShimmer = false.obs;
  final RxList<PlanningWeekActivity> activities = <PlanningWeekActivity>[].obs;

  RefreshController refreshController;

  @override
  Future<void> onInit() async {
    showShimmer.value = true;
    refreshController = RefreshController(initialRefresh: false);
    fetchActivities();
    super.onInit();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  Future<void> fetchActivities() async {
    final Either<BaseFailure, List<PlanningWeekActivity>> failureOrActivities =
        await planningRepository.getDashActivitiesList();
  }
}
