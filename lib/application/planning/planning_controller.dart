import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Future<void> onInit() async {
    calendarController = CalendarController();
    fetchEventsByDate(DateTime.now());
    super.onInit();
  }

  @override
  void onClose() {
    calendarController.dispose();
    super.onClose();
  }

  Future<void> fetchEventsByDate(DateTime date) async {
    showShimmer.value = true;

    final Either<BaseFailure, List<PlanningActivity>> failureOrActivities =
        await planningRepository.getDayActivitiesList(date);

    failureOrActivities.fold(
      (BaseFailure left) {
        showShimmer.value = false;
        SnackBarUtils.error(message: 'http_common'.tr);
      },
      (List<PlanningActivity> right) {
        showShimmer.value = false;
        //events.clear();
        allEvents[date] = right;
        selectedDateEvents.clear();
        selectedDateEvents.addAll(right);
      },
    );
  }

  void onDaySelected(DateTime day, List events, List holidays) async {
    print(day);
    selectedDate.value = day;

    print(events);
    if (events.isEmpty) {
      await fetchEventsByDate(day);
      return;
    }

    selectedDateEvents.clear();
    selectedDateEvents.addAll(events as List<PlanningActivity>);
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
