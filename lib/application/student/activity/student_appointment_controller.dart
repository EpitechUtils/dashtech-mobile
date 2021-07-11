import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentAppointmentController extends GetxController {
  final StudentActivityController activityController = Get.find();
  final IPlanningRepository planningRepository = Get.find();

  final RxBool isLoading = true.obs;
  final Rxn<PlanningRdvDetails$Query$ActivityRdvDetails> appointmentDetails = Rxn();
  final Rxn<PlanningRdvDetails$Query$ActivityRdvDetails$ActivityRdvSlotBloc$ActivityRdvSlot>
      groupSlot = Rxn();
  final Rxn<PlanningRdvDetails$Query$ActivityRdvDetails$ActivityRdvSlotBloc> currentSlotBloc =
      Rxn();

  Future<void> onInit() async {
    _fetchAppointmentDetails();
    super.onInit();
  }

  Future<void> _fetchAppointmentDetails() async {
    try {
      final failOrRdvDetails = await this.planningRepository.getRdvDetails(
            CodesInput.fromJson(
              {
                'scolarYear': activityController.activity.value!.scolaryear,
                'codeModule': activityController.activity.value!.codemodule,
                'codeInstance': activityController.activity.value!.codeinstance,
                'codeActi': activityController.activity.value!.codeacti
              },
            ),
          );

      failOrRdvDetails.fold(
        (left) {
          SnackBarUtils.error(message: 'http_common');
          isLoading.value = false;
        },
        (right) {
          appointmentDetails.value = right;
          if (appointmentDetails.value!.group == null) {
            isLoading.value = false;
            return;
          }

          appointmentDetails.value!.slots!.forEach((bloc) {
            bloc.slots!.forEach((slot) {
              if (slot.code == appointmentDetails.value!.group!.code) groupSlot.value = slot;
            });
          });

          isLoading.value = false;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void changeSlotBlocByEvent(PlanningActivityDetails$Query$ActivityDetails$ActivityEvent event) {
    try {
      currentSlotBloc.value =
          appointmentDetails.value!.slots!.where((bloc) => bloc.codeevent == event.code).first;
    } catch (ingored) {}
  }

  String parseDateOfSlot() {
    DateTime begin = DateFormat("yyyy-MM-dd HH:mm:ss").parse(groupSlot.value!.date!);
    DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin);
  }

  List<PlanningRdvDetails$Query$ActivityRdvDetails$ActivityRdvSlotBloc$ActivityRdvSlot>
      getSlotsForEventCode(String code) {
    try {
      return appointmentDetails.value!.slots!.where((bloc) => bloc.codeevent == code).first.slots!;
    } catch (ignored) {
      return [];
    }
  }

  bool get isRegistered => () {
        try {
          return appointmentDetails.value!.studentRegistered != null &&
              appointmentDetails.value!.studentRegistered == "true" &&
              appointmentDetails.value!.studentRegistered != "false";
        } catch (ignored) {
          return false;
        }
      }();
}
