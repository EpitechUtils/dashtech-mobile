import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/card/models/card_history.dart';
import 'package:dashtech/domain/card/models/filters/filter_course.dart';
import 'package:dashtech/domain/card/models/filters/filter_details.dart';
import 'package:dashtech/domain/card/models/filters/filter_promo.dart';
import 'package:dashtech/domain/card/models/filters/filter_scolaryear.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/domain/card/models/card.dart' as models;
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/card/input/filter_details_input.dart';
import 'package:dashtech/infrastructure/card/input/promo_fetch_input.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

enum Filter { YEARS, COURSES, PROMOS }

class AdminCardController extends GetxController {
  final ICardRepository cardRepository = Get.find();

  final RxBool isLoading = false.obs;
  final RxList<TrombiUser> users = RxList([]);

  final RxMap<Filter, bool> filterIsLoading = RxMap<Filter, bool>({
    Filter.YEARS: false,
    Filter.COURSES: false,
    Filter.PROMOS: false,
  });
  final RxList<FilterScolaryear> filterYears = RxList([]);
  final RxList<FilterCourse> filterCourses = RxList([]);
  final RxList<FilterPromo> filterPromos = RxList([]);
  final Rxn<FilterScolaryear> filterYear = Rxn(null);
  final Rxn<FilterCourse> filterCourse = Rxn(null);
  final Rxn<FilterPromo> filterPromo = Rxn(null);

  final RxList<CardHistory> cardHistory = RxList([]);

  @override
  Future<void> onInit() async {
    this.getFilterByName(Filter.YEARS);
    super.onInit();
  }

  /// Get filter values by params
  Future<void> getFilterByName(Filter filter) async {
    filterIsLoading[filter] = true;

    final Either<BaseFailure, FilterDetails> failOrDetails = await this
        .cardRepository
        .getFilterValue(
          FilterDetailsInput(
            filter: EnumToString.convertToString(filter).toLowerCase(),
            scolaryear:
                filterYear.value == null ? null : filterYear.value!.scolaryear,
            course:
                filterCourse.value == null ? null : filterCourse.value!.code,
          ),
        );

    failOrDetails.fold(
      (BaseFailure left) {
        filterIsLoading[filter] = false;
        SnackBarUtils.error(message: 'http_common');
      },
      (FilterDetails right) {
        filterIsLoading[filter] = false;

        if (right.filterType == "years") {
          filterYears.value = right.years!;
        } else if (right.filterType == "courses") {
          filterCourses.value = right.courses!;
        } else if (right.filterType == "promos") {
          filterPromos.value = right.promos!;
        }
      },
    );
  }

  /// Fetch profiles by given filters
  Future<void> fetchProfilesByFilters() async {
    isLoading.value = true;
    final Either<BaseFailure, List<TrombiUser>> failOrUsers =
        await this.cardRepository.getUsersByFilters(
              PromoFetchInput(
                course: this.filterCourse.value!.code,
                promo: this.filterPromo.value!.promo,
              ),
            );

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

  /// Get suer history from login
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

  /// Update or create new card by NFC
  Future<void> updateCardByNFC(TrombiUser user) async {
    NFCAvailability availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      return;
    }

    try {
      NFCTag tag = await FlutterNfcKit.poll(
        iosAlertMessage: "admin_card_present_card".tr,
      );

      if (tag.type != NFCTagType.mifare_desfire) {
        await FlutterNfcKit.finish(
          iosErrorMessage: "admin_card_not_epitech_card".tr,
        );
        return;
      }

      final Either<BaseFailure, models.Card> failOrInfo =
          await this.cardRepository.updateCard(user.login, tag.id);

      await failOrInfo.fold(
        (BaseFailure left) async {
          left.map(
              unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
              notFound: (_) {},
              conflict: (_) async {
                final String email = _.message!.split(':').last;
                await FlutterNfcKit.finish(
                    iosErrorMessage: 'admin_card_already_used_by'.trParams(
                  {'login': email},
                )!);
              },
              unauthorized: (_) {});
        },
        (models.Card right) async {
          await FlutterNfcKit.finish(
            iosAlertMessage: 'admin_card_associated_to'.trParams(
              {'user': user.title},
            )!,
          );

          // Set values
          users.value = users.map((elem) {
            if (elem.login == user.login)
              return elem.copyWith.call(card: right);
            return elem;
          }).toList();

          // Close bottomsheet and display success
          Get.back();
          SnackBarUtils.success(
            message: 'admin_card_associated_to'.trParams(
              {'user': user.title},
            )!,
          );
        },
      );
    } catch (err) {
      if (err is PlatformException && err.code == "500") return;
      SnackBarUtils.error(message: 'http_common');
      await FlutterNfcKit.finish(iosErrorMessage: "http_common".tr);
      return;
    }
  }

  /// Remove card by user login
  Future<void> removeCard(TrombiUser user) async {
    final Either<BaseFailure, void> failOrSuccess =
        await this.cardRepository.removeCard(user.login);

    failOrSuccess.fold(
      (BaseFailure left) {
        SnackBarUtils.error(message: 'http_common');
      },
      (_) {
        // Set values
        users.value = users.map((elem) {
          if (elem.login == user.login) return elem.copyWith.call(card: null);
          return elem;
        }).toList();

        // Close bottomsheet and display success
        Get.back();
        SnackBarUtils.success(message: 'admin_card_successfully_deleted'.tr);
      },
    );
  }
}
