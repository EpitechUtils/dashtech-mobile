import 'package:dartz/dartz.dart';
import 'package:dashtech/application/student/activity/student_activity_controller.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/domain/planning/adapters/planning_repository_adapter.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/domain/planning/models/activity_rdv_details.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StudentAppointmentController extends GetxController {
  final StudentActivityController activityController = Get.find();
  final IPlanningRepository planningRepository = Get.find();

  final RxBool isLoading = true.obs;
  final Rxn<ActivityRdvDetails> appointmentDetails = Rxn<ActivityRdvDetails>();
  final Rxn<ActivityRdvSlot> groupSlot = Rxn<ActivityRdvSlot>();
  final Rxn<ActivityRdvSlotBloc> currentSlotBloc = Rxn<ActivityRdvSlotBloc>();

  Future<void> onInit() async {
    _fetchAppointmentDetails();
    super.onInit();
  }

  Future<void> _fetchAppointmentDetails() async {
    try {
      final Either<BaseFailure, ActivityRdvDetails> failOrRdvDetails =
          await this.planningRepository.getRdvDetails({
        'scolarYear': activityController.activity.value!.scolaryear,
        'codeModule': activityController.activity.value!.codemodule,
        'codeInstance': activityController.activity.value!.codeinstance,
        'codeActi': activityController.activity.value!.codeacti
      });

      failOrRdvDetails.fold(
        (BaseFailure left) {
          SnackBarUtils.error(message: 'http_common');
          isLoading.value = false;
        },
        (ActivityRdvDetails right) {
          appointmentDetails.value = right;
          if (appointmentDetails.value!.group == null) {
            isLoading.value = false;
            return;
          }

          appointmentDetails.value!.slots.forEach((bloc) {
            bloc.slots.forEach((slot) {
              if (slot.code == appointmentDetails.value!.group!.code)
                groupSlot.value = slot;
            });
          });

          isLoading.value = false;
        },
      );
    } catch (e) {
      print(e);
    }
  }

  void changeSlotBlocByEvent(ActivityDetailsEvent event) {
    try {
      currentSlotBloc.value = appointmentDetails.value!.slots
          .where((bloc) => bloc.codeevent == event.code)
          .first;
    } catch (ingored) {}
  }

  String parseDateOfSlot() {
    DateTime begin =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(groupSlot.value!.date);
    DateFormat dateFormat = DateFormat.MMMMEEEEd(Get.locale!.toLanguageTag());

    return dateFormat.format(begin);
  }

  Color getSlotColor(ActivityRdvSlot slot) {
    if (slot.code == null) {
      return Colors.grey[300]!;
    }

    if (appointmentDetails.value!.group != null &&
        slot.code == appointmentDetails.value!.group!.code) {
      return Color(successColor);
    }

    return Colors.white;
  }

  List<ActivityRdvSlot> getSlotsForEventCode(String code) {
    try {
      return appointmentDetails.value!.slots
          .where((bloc) => bloc.codeevent == code)
          .first
          .slots;
    } catch (ignored) {
      return [];
    }
  }

  bool get isRegistered => () {
        try {
          return appointmentDetails.value!.student_registered != null &&
              appointmentDetails.value!.student_registered == "true" &&
              appointmentDetails.value!.student_registered != "false";
        } catch (ignored) {
          return false;
        }
      }();
}
