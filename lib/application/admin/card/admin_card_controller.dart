import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/card/models/card_history.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/card/models/card.dart' as models;
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class AdminCardController extends GetxController {
  final ICardRepository cardRepository = Get.find();

  final RxBool isLoading = false.obs;
  final RxString filterYear = "2020".obs;
  final RxString filterCourse = "bachelor/classic".obs;
  final RxString filterPromo = "tek2".obs;
  final RxList<TrombiUser> users = RxList([]);

  final RxList<CardHistory> cardHistory = RxList([]);
  final RxInt currentBottomIndex = 0.obs;

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
    currentBottomIndex.value = 0;
    Get.bottomSheet(
      TrombiUserBottomSheet(user),
      backgroundColor: Color(fillColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }

  Future<void> getUserCardHistory(TrombiUser user) async {
    cardHistory.clear();
    final Either<BaseFailure, List<CardHistory>> failOrInfo =
        await this.cardRepository.getCardHistory(user.login);

    failOrInfo.fold(
      (BaseFailure left) {
        SnackBarUtils.error(message: 'http_common');
      },
      (List<CardHistory> right) {
        cardHistory.value = right.reversed.toList();
      },
    );
  }

  Future<void> updateCardByNFC(TrombiUser user) async {
    NFCAvailability availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      return;
    }

    try {
      NFCTag tag = await FlutterNfcKit.poll(
        iosAlertMessage: "Présentez votre carte",
      );

      if (tag.type != NFCTagType.mifare_desfire) {
        await FlutterNfcKit.finish(
          iosErrorMessage: "Cette carte ne provient pas d'Epitech.",
        );
        return;
      }

      final Either<BaseFailure, models.Card> failOrInfo =
          await this.cardRepository.updateCard(user.login, tag.id);

      await failOrInfo.fold(
        (BaseFailure left) async {
          SnackBarUtils.error(message: 'http_common');
          await FlutterNfcKit.finish(iosErrorMessage: "http_common".tr);
        },
        (models.Card right) async {
          await FlutterNfcKit.finish(
            iosAlertMessage: "Carte ajouté pour " + user.title,
          );

          // Set values
          users.value = users.map((elem) {
            if (elem.login == user.login)
              return elem.copyWith.call(card: right);
            return elem;
          }).toList();

          // Close bottomsheet and display success
          Get.back();
        },
      );
    } catch (err) {
      if (err is PlatformException && err.code == "500") return;
      SnackBarUtils.error(message: 'http_common');
      await FlutterNfcKit.finish(iosErrorMessage: "http_common".tr);
      return;
    }
  }
}
