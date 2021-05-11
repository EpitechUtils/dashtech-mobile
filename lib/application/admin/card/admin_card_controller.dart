import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:get/get.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class AdminCardController extends GetxController {
  final ICardRepository cardRepository = Get.find();

  final RxBool isLoading = false.obs;
  final RxString filterYear = "2020".obs;
  final RxString filterCourse = "bachelor/classic".obs;
  final RxString filterPromo = "tek2".obs;
  final RxList<TrombiUser> users = RxList([]);

  Future<void> fetchProfilesByFilters() async {
    isLoading.value = true;
    final PromoFetchInput filters = PromoFetchInput(
      course: this.filterCourse.value,
      promo: this.filterPromo.value,
    );
    final Either<BaseFailure, List<TrombiUser>> failOrUsers =
        await this.cardRepository.getUsersByFilters(filters);

    failOrUsers.fold(
      (BaseFailure left) {
        isLoading.value = false;
        SnackBarUtils.error(message: 'http_common');
      },
      (List<TrombiUser> right) {
        isLoading.value = false;
        users.value = right;
      },
    );
  }

  Future<void> searchForNfcTag() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      // oh-no
    }

    // timeout only works on Android, while the latter two messages are only for iOS
    var tag = await FlutterNfcKit.poll(
      iosAlertMessage: "Présentez une carte étudiante",
    );

    print(jsonEncode(tag));
    if (tag.type != NFCTagType.mifare_desfire) {
      await FlutterNfcKit.finish(
          iosErrorMessage: "Cette carte ne provient pas d'Epitech.");
      return;
    }

    await FlutterNfcKit.finish(iosAlertMessage: tag.id);
  }
}