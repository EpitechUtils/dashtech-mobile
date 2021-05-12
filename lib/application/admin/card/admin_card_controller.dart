import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/card/models/card_result.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class AdminCardController extends GetxController {
  final ICardRepository cardRepository = Get.find();

  final RxBool isLoading = false.obs;
  final RxString filterYear = "2020".obs;
  final RxString filterCourse = "bachelor/classic".obs;
  final RxString filterPromo = "tek2".obs;
  final RxList<TrombiUser> users = RxList([]);

  final RxBool userCardInfoIsLoading = false.obs;
  final Rxn<CardResult> userCardResult = Rxn<CardResult>();

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

  void onUserSelected(TrombiUser user) {
    Get.bottomSheet(
      TrombiUserBottomSheet(user),
      backgroundColor: Color(fillColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Future<void> getUserCardInfo(TrombiUser user) async {
    userCardInfoIsLoading.value = true;
    final Either<BaseFailure, CardResult> failOrInfo =
        await this.cardRepository.getCardInfoByLogin(user.login);

    failOrInfo.fold(
      (BaseFailure left) {
        userCardInfoIsLoading.value = false;
        SnackBarUtils.error(message: 'http_common');
      },
      (CardResult right) {
        userCardInfoIsLoading.value = false;
        print(right.toString());
        userCardResult.value = right;
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
