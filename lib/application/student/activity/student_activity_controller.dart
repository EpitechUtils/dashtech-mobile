import 'package:dartz/dartz.dart';
import 'package:dashtech/application/student/activity/student_appointment_controller.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class StudentActivityController extends GetxController {
  final IPlanningRepository planningRepository = Get.find();

  final Rxn<ActivityDetails> activity = Rxn<ActivityDetails>();
  final RxBool isLoading = true.obs;

  late StudentAppointmentController appointmentController;

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
          if (this.isAppointment) appointmentController = Get.find();
        },
      );
    } catch (e) {
      print(e);
    }
  }

  String? getStudentStatus() {
    return activity.value!.events[0].user_status;
  }

  bool isStudentRegistered() {
    try {
      return activity.value!.events[0].already_register != null;
    } catch (ignored) {
      return false;
    }
  }

  String parseDate() {
    DateTime begin = DateFormat("yyyy-MM-dd HH:mm:ss").parse(activity.value!.begin);
    DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin);
  }

  String parseActivityRoom() {
    String room = "undefined";
    try {
      room = activity.value!.events[0].location.substring(
              activity.value!.events[0].location.lastIndexOf('/') + 1,
              activity.value!.events[0].location.length) +
          " - " +
          activity.value!.events[0].nb_inscrits +
          "/" +
          activity.value!.events[0].seats;
    } catch (ignored) {}

    return room;
  }

  String parseActivityTime(String value, {int addMinutes = 0}) {
    DateFormat hMFormat = DateFormat.Hm(Get.locale!.toLanguageTag());
    DateTime dateTime =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(value).add(Duration(minutes: addMinutes));

    return hMFormat.format(dateTime);
  }

  bool get isAppointment => activity.value!.type_code == "rdv";
}
