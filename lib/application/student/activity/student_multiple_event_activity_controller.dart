import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class StudentMultipleEventActivityController extends GetxController {
  final StudentActivityController activityController = Get.find();
  final IPlanningRepository planningRepository = Get.find();
  final IAuthRepository authRepository = Get.find();

  final RxInt currentTabIndex = 0.obs;
  final Rxn<PlanningActivityDetails$Query$ActivityDetails$ActivityEvent> selectedEvent = Rxn();

  final List<Worker> workers = <Worker>[];

  @override
  Future<void> onInit() async {
    _initWorkers();
    selectedEvent.value = activityController.activity.value!.events!.first;
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    workers.map((worker) => worker.dispose());
    super.onClose();
  }

  String parseDate(PlanningActivityDetails$Query$ActivityDetails$ActivityEvent event) {
    DateTime begin = DateFormat("yyyy-MM-dd HH:mm:ss").parse(event.begin!);
    DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin);
  }

  String parseDateWithHm(PlanningActivityDetails$Query$ActivityDetails$ActivityEvent event) {
    DateTime begin = DateFormat("yyyy-MM-dd HH:mm:ss").parse(event.begin!);
    DateTime end = DateFormat("yyyy-MM-dd HH:mm:ss").parse(event.end!);
    DateFormat hMFormat = DateFormat.Hm(Get.locale!.toLanguageTag());
    DateFormat dateFormat = DateFormat.MMMd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin) +
        " (" +
        hMFormat.format(begin) +
        " - " +
        hMFormat.format(end) +
        ") | " +
        parseActivityRoom(event: event, includeSeats: false);
  }

  String? getStudentStatus() {
    return selectedEvent.value!.userStatus;
  }

  bool isStudentRegistered() {
    try {
      return selectedEvent.value!.alreadyRegister != null;
    } catch (ignored) {
      return false;
    }
  }

  String parseActivityRoom({
    PlanningActivityDetails$Query$ActivityDetails$ActivityEvent? event,
    bool includeSeats = true,
  }) {
    String room = "undefined";
    final choosed = event == null ? selectedEvent.value! : event;
    try {
      room = choosed.location!
              .substring(choosed.location!.lastIndexOf('/') + 1, choosed.location!.length) +
          (includeSeats ? (" - " + choosed.nbInscrits! + "/" + choosed.seats!) : "");
    } catch (ignored) {}

    return room;
  }

  void _initWorkers() {
    workers.add(ever(
      currentTabIndex,
      (int val) {
        if (activityController.isAppointment && val == 0) return;

        selectedEvent.value = activityController
            .activity.value!.events![val - (activityController.isAppointment ? 1 : 0)];
      },
    ));
  }
}
