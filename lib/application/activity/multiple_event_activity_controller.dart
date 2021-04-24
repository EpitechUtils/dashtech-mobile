import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/auth/adapters/auth_repository_adapter.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class MultipleEventActivityController extends GetxController {
  MultipleEventActivityController({required this.planningRepository});

  final ActivityController activityController = Get.find();
  final IPlanningRepository planningRepository;
  final IAuthRepository authRepository = Get.find();

  final RxInt currentTabIndex = 0.obs;
  final Rxn<ActivityDetailsEvent> selectedEvent = Rxn<ActivityDetailsEvent>();

  final List<Worker> workers = <Worker>[];

  @override
  Future<void> onInit() async {
    _initWorkers();
    selectedEvent.value = activityController.activity.value!.events.first;
    super.onInit();
  }

  @override
  Future<void> onClose() async {
    workers.map((worker) => worker.dispose());
    super.onClose();
  }

  String parseDate(ActivityDetailsEvent event) {
    DateTime begin = DateFormat("yyyy-MM-dd HH:mm:ss").parse(event.begin);
    DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin);
  }

  String parseDateWithHm(ActivityDetailsEvent event) {
    DateTime begin = DateFormat("yyyy-MM-dd HH:mm:ss").parse(event.begin);
    DateTime end = DateFormat("yyyy-MM-dd HH:mm:ss").parse(event.end);
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
    return selectedEvent.value!.user_status;
  }

  bool isStudentRegistered() {
    try {
      return selectedEvent.value!.already_register != null;
    } catch (ignored) {
      return false;
    }
  }

  String parseActivityRoom(
      {ActivityDetailsEvent? event, bool includeSeats = true}) {
    String room = "undefined";
    ActivityDetailsEvent choosed = event == null ? selectedEvent.value! : event;
    try {
      room = choosed.location.substring(
              choosed.location.lastIndexOf('/') + 1, choosed.location.length) +
          (includeSeats
              ? (" - " + choosed.nb_inscrits + "/" + choosed.seats)
              : "");
    } catch (ignored) {}

    return room;
  }

  void _initWorkers() {
    workers.add(ever(
      currentTabIndex,
      (int val) {
        if (activityController.isAppointment && val == 0) return;

        selectedEvent.value = activityController.activity.value!
            .events[val - (activityController.isAppointment ? 1 : 0)];
      },
    ));
  }
}
