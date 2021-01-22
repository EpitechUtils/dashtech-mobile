import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:table_calendar/table_calendar.dart';

class PlanningController extends GetxController {
  PlanningController({@required this.planningRepository});

  final IPlanningRepository planningRepository;

  final RxBool showShimmer = true.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxList<PlanningActivity> selectedDateEvents = <PlanningActivity>[].obs;
  final RxMap<DateTime, List<PlanningActivity>> allEvents =
      <DateTime, List<PlanningActivity>>{}.obs;

  CalendarController calendarController;
  RefreshController refreshController;

  @override
  Future<void> onInit() async {
    allEvents.addAll({});
    calendarController = CalendarController();
    refreshController = RefreshController();
    fetchEventsByDate(DateTime.now(), false);
    super.onInit();
  }

  @override
  void onClose() {
    calendarController.dispose();
    refreshController.dispose();
    super.onClose();
  }

  Future<void> fetchEventsByDate(DateTime date, bool refresh) async {
    showShimmer.value = true;

    final Either<BaseFailure, List<PlanningActivity>> failureOrActivities =
        await planningRepository.getDayActivitiesList(date);

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
      (List<PlanningActivity> right) {
        showShimmer.value = false;
        if (refresh) {
          refreshController.refreshCompleted();
        }

        if (right.isEmpty) {
          refreshController.loadNoData();
        } else {
          refreshController.loadComplete();
        }
        allEvents[date] = right;
        selectedDateEvents.clear();
        selectedDateEvents.addAll(right);
        update();
      },
    );
  }

  void onDaySelected(DateTime day, List events, List holidays) async {
    print(day);
    selectedDate.value = day;

    print(events);
    if (events.isEmpty) {
      await fetchEventsByDate(day, false);
      return;
    }

    selectedDateEvents.clear();
    selectedDateEvents.addAll(events as List<PlanningActivity>);
    update();
  }

  void onVisibleDaysChanged(
    DateTime first,
    DateTime last,
    CalendarFormat format,
  ) {}

  void onCalendarCreated(
    DateTime first,
    DateTime last,
    CalendarFormat format,
  ) {}
}
