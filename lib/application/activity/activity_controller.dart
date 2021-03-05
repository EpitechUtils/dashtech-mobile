import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ActivityController extends GetxController {
  ActivityController({@required this.planningRepository})
      : assert(planningRepository != null);

  final Rx<ActivityDetails> activity = ActivityDetails().obs;
  final RxBool isLoading = true.obs;

  final IPlanningRepository planningRepository;

  @override
  Future<void> onReady() async {
    _fetchActivity(Get.arguments);
    super.onReady();
  }

  Future<void> _fetchActivity(Map<String, String> codes) async {
    isLoading.value = true;

    try {
      final Either<BaseFailure, ActivityDetails> failOrActivity =
          await this.planningRepository.getActivityDetails(codes);

      failOrActivity.fold(
        (BaseFailure left) {
          isLoading.value = false;
          SnackBarUtils.error(message: 'http_common');
        },
        (ActivityDetails right) {
          isLoading.value = false;
          activity.value = right;
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
