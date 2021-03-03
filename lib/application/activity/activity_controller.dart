import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ActivityController extends GetxController {
  ActivityController({@required this.planningRepository})
      : assert(planningRepository != null);

  final Rx<PlanningActivity> activity = null.obs;
  final RxBool isLoading = true.obs;

  final IPlanningRepository planningRepository;

  @override
  Future<void> onReady() async {
    _fetchActivity(Get.arguments);
    super.onReady();
  }

  Future<void> _fetchActivity(Map<String, String> codes) async {
    isLoading.value = true;
  }
}
