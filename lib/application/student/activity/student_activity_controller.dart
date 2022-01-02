import 'package:dashtech/application/student/activity/student_appointment_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class StudentActivityController extends GetxController {
  final IPlanningRepository planningRepository = Get.find();

  //final Rxn<PlanningActivityDetails$Query$ActivityDetails> activity = Rxn(null);
  final Rxn<dynamic> activity = Rxn(null);
  final RxBool isLoading = true.obs;

  late StudentAppointmentController appointmentController;

  @override
  Future<void> onReady() async {
    print(Get.arguments);
    _fetchActivity(Get.arguments);
    super.onReady();
  }

  Future<void> _fetchActivity(Map<String, dynamic> codes) async {
    isLoading.value = true;

    try {
      final failOrActivity = await this.planningRepository.getActivityDetails(
            /*CodesInput.fromJson(codes)*/
            null,
          );

      failOrActivity.fold(
        (left) {
          isLoading.value = false;
          SnackBarUtils.error(message: 'http_common');
        },
        (right) {
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
    return activity.value!.events![0].userStatus;
  }

  bool isStudentRegistered() {
    try {
      return activity.value!.events![0].alreadyRegister != null;
    } catch (ignored) {
      return false;
    }
  }

  String parseDate() {
    DateTime begin =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(activity.value!.begin!);
    DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin);
  }

  String parseActivityRoom() {
    String room = "undefined";
    try {
      room = activity.value!.events![0].location!.substring(
              activity.value!.events![0].location!.lastIndexOf('/') + 1,
              activity.value!.events![0].location!.length) +
          " - " +
          activity.value!.events![0].nbInscrits! +
          "/" +
          activity.value!.events![0].seats!;
    } catch (ignored) {}

    return room;
  }

  String parseActivityTime(String value, {int addMinutes = 0}) {
    DateFormat hMFormat = DateFormat.Hm(Get.locale!.toLanguageTag());
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse(value)
        .add(Duration(minutes: addMinutes));

    return hMFormat.format(dateTime);
  }

  bool get isAppointment => activity.value!.typeCode == "rdv";
}
