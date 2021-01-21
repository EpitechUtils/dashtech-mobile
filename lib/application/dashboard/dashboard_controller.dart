import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_store/domain/core/failures/base_failure.dart';
import 'package:flutter_file_store/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:flutter_file_store/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  DashboardController({@required this.planningRepository});

  final IPlanningRepository planningRepository;

  final RxBool showShimmer = false.obs;

  @override
  Future<void> onInit() async {
    showShimmer.value = true;
    fetchActivities();

    super.onInit();
  }

  Future<void> fetchActivities() async {
    final Either<BaseFailure, bool> failureOrJobs =
        await planningRepository.getDashActivitiesList();
  }
}
