import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class StudentPlanningController extends GetxController {
  final IPlanningRepository planningRepository = Get.find();

  final RxBool showShimmer = true.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final RxMap<DateTime, List<PlanningWeekActivities$Query$PlanningWeekActivity$PlanningActivity>>
      allEvents = RxMap();

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
    final failureOrActivities = await planningRepository.getWeekActivitiesList(start, end);

    failureOrActivities.fold(
      (left) {
        showShimmer.value = false;
        SnackBarUtils.error(message: 'http_common'.tr);
      },
      (right) {
        showShimmer.value = false;
        right.forEach((e) {
          var acts = e.activities;
          acts.sort((a, b) => DateTime.parse(a.start!).compareTo(DateTime.parse(b.start!)));
          allEvents[DateTime.parse(e.date)] = acts;
        });
        update(['planning_display']);
      },
    );
  }

  void onActivityTap(CalendarTapDetails details) {
    if (details.appointments == null) return;
    final activity = details.appointments![0];
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
