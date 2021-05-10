import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/domain/planning/models/planning_week_activity.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class PlanningController extends GetxController {
  PlanningController({required this.planningRepository});

  final IPlanningRepository planningRepository;

  final RxBool showShimmer = true.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxMap<DateTime, List<PlanningActivity>> allEvents =
      <DateTime, List<PlanningActivity>>{}.obs;

  late CalendarController calendarController;

  @override
  Future<void> onInit() async {
    allEvents.addAll({});
    calendarController = CalendarController();
    final date = DateTime.now();
    fetchEventsByWeek(date.subtract(Duration(days: date.weekday - 1)),
        date.add(Duration(days: DateTime.daysPerWeek - date.weekday)));
    super.onInit();
  }

  @override
  void onClose() {
    calendarController.dispose();
    super.onClose();
  }

  Future<void> fetchEventsByWeek(
    DateTime start,
    DateTime end,
  ) async {
    final Either<BaseFailure, List<PlanningWeekActivity>> failureOrActivities =
        await planningRepository.getWeekActivitiesList(start, end);

    failureOrActivities.fold(
      (BaseFailure left) {
        showShimmer.value = false;
        SnackBarUtils.error(message: 'http_common'.tr);
      },
      (List<PlanningWeekActivity> right) {
        showShimmer.value = false;
        right.forEach((e) {
          List<PlanningActivity> acts = e.activities;
          acts.sort((a, b) =>
              DateTime.parse(a.start).compareTo(DateTime.parse(b.start)));
          allEvents[DateTime.parse(e.date)] = acts;
        });
        update(['planning_display']);
      },
    );
  }

  void onActivityTap(CalendarTapDetails details) {
    if (details.appointments == null) return;
    PlanningActivity activity = details.appointments![0];
    Get.toNamed(
      Routes.activity_details,
      arguments: {
        'scolarYear': activity.scolaryear,
        'codeModule': activity.codemodule,
        'codeInstance': activity.codeinstance,
        'codeActi': activity.codeacti
      },
    );
  }

  void onViewChanged(ViewChangedDetails details) {
    if (!allEvents.keys.contains(details.visibleDates.first) ||
        !allEvents.keys.contains(details.visibleDates.first)) {
      fetchEventsByWeek(details.visibleDates.first, details.visibleDates.last);
    }
  }
}
