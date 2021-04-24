import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/datasource/activity_datasource.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanningController extends GetxController {
  PlanningController({required this.planningRepository});

  final IPlanningRepository planningRepository;

  final RxBool showShimmer = true.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxList<PlanningActivity> selectedDateEvents = <PlanningActivity>[].obs;
  final RxMap<DateTime, List<PlanningActivity>> allEvents =
      <DateTime, List<PlanningActivity>>{}.obs;

  //CalendarController calendarController;
  late RefreshController refreshController;

  @override
  Future<void> onInit() async {
    allEvents.addAll({});
    //calendarController = CalendarController();
    refreshController = RefreshController();
    super.onInit();
  }

  @override
  void onClose() {
    //calendarController.dispose();
    refreshController.dispose();
    super.onClose();
  }

  Future<void> fetchEventsByWeek(
    DateTime start,
    DateTime end,
    bool refresh,
  ) async {
    final Either<BaseFailure, List<PlanningWeekActivity>> failureOrActivities =
        await planningRepository.getWeekActivitiesList(start, end);

    failureOrActivities.fold(
      (BaseFailure left) {
        showShimmer.value = false;
        if (refresh) {
          refreshController.refreshFailed();
          return;
        }
        refreshController.loadFailed();
        SnackBarUtils.error(message: 'http_common'.tr);
      },
      (List<PlanningWeekActivity> right) {
        showShimmer.value = false;
        if (refresh) {
          refreshController.refreshCompleted();
        }

        if (right.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        right.forEach((e) {
          List<PlanningActivity> acts = e.activities;
          acts.sort((a, b) =>
              DateTime.parse(a.start).compareTo(DateTime.parse(b.start)));
          allEvents[DateTime.parse(e.date)] = acts;
        });
        update();
      },
    );
  }

  void onDaySelected(DateTime day, List events, List holidays) async {
    selectedDate.value = day;
    selectedDateEvents.clear();
    selectedDateEvents
        .addAll(events.isNotEmpty ? events as List<PlanningActivity> : []);
    update();
  }

  void onVisibleDaysChanged(
    DateTime first,
    DateTime last,
    CalendarFormat format,
  ) async {
    if (!allEvents.keys.contains(first) || !allEvents.keys.contains(last)) {
      //showShimmer.value = true;
      await fetchEventsByWeek(first, last, false);
    }
  }

  void onCalendarCreated(
    DateTime first,
    DateTime last,
    CalendarFormat format,
  ) {
    Future.delayed(
      Duration(seconds: 1),
      () => fetchEventsByWeek(first, last, false),
    );
  }

  ActivityDataSource get dataSource => ActivityDataSource(selectedDateEvents);
}
