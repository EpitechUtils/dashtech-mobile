import 'package:dartz/dartz.dart';
import 'package:dashtech/domain/card/adapters/card_repository_adapter.dart';
import 'package:dashtech/domain/core/failures/base_failure.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/core/utils/snack_bar_utils.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/services.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:get/get.dart';

enum Filter { YEARS, COURSES, PROMOS }

class AdminCardController extends GetxController {
  final ICardRepository cardRepository = Get.find();

  final RxBool isLoading = false.obs;
  final RxList<CardGetUsersByFilters$Query$TrombiUserType> users = RxList([]);

  final RxMap<Filter, bool> filterIsLoading = RxMap<Filter, bool>({
    Filter.YEARS: false,
    Filter.COURSES: false,
    Filter.PROMOS: false,
  });
  final RxList<CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>
      filterYears = RxList([]);
  final RxList<CardGetFilterValues$Query$FilterDetailsType$CourseType>
      filterCourses = RxList([]);
  final RxList<CardGetFilterValues$Query$FilterDetailsType$PromoType>
      filterPromos = RxList([]);
  final Rxn<CardGetFilterValues$Query$FilterDetailsType$ScolarYearType>
      filterYear = Rxn(null);
  final Rxn<CardGetFilterValues$Query$FilterDetailsType$CourseType>
      filterCourse = Rxn(null);
  final Rxn<CardGetFilterValues$Query$FilterDetailsType$PromoType> filterPromo =
      Rxn(null);

  final RxList<CardHistoryByLogin$Query$CardHistoryEntity> cardHistory =
      RxList([]);

  @override
  Future<void> onInit() async {
    this.getFilterByName(Filter.YEARS);
    super.onInit();
  }

  /// Get filter values by params
  Future<void> getFilterByName(Filter filter) async {
    filterIsLoading[filter] = true;

    final failOrDetails = await this.cardRepository.getFilterValue(
          FilterDetailsInput(
            filter: EnumToString.convertToString(filter).toLowerCase(),
            scolaryear:
                filterYear.value == null ? null : filterYear.value!.scolaryear,
            course:
                filterCourse.value == null ? null : filterCourse.value!.code,
          ),
        );

    failOrDetails.fold(
      (left) {
        filterIsLoading[filter] = false;
        SnackBarUtils.error(message: 'http_common');
      },
      (right) {
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
    final failOrUsers = await this.cardRepository.getUsersByFilters(
          PromoFetchInput(
            course: this.filterCourse.value!.code,
            promo: this.filterPromo.value!.promo,
          ),
        );

    failOrUsers.fold(
      (left) {
        isLoading.value = false;
        SnackBarUtils.error(message: 'http_common');
      },
      (right) {
        isLoading.value = false;
        users.value = right;
      },
    );
  }

  /// Get suer history from login
  Future<void> getUserCardHistory(
      CardGetUsersByFilters$Query$TrombiUserType user) async {
    cardHistory.clear();
    final failOrInfo = await this.cardRepository.getCardHistory(user.login);

    failOrInfo.fold(
      (left) {
        SnackBarUtils.error(message: 'http_common');
      },
      (right) {
        cardHistory.value = right.reversed.toList();
      },
    );
  }

  /// Update or create new card by NFC
  Future<void> updateCardByNFC(
      CardGetUsersByFilters$Query$TrombiUserType user) async {
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

      final failOrInfo =
          await this.cardRepository.updateCard(user.login, tag.id);

      await failOrInfo.fold(
        (left) async {
          left.map(
              unexpected: (_) => SnackBarUtils.error(message: 'http_common'),
              notFound: (_) {},
              conflict: (_) async {
                final String email = _.message!.split(':').last;
                await FlutterNfcKit.finish(
                    iosErrorMessage: 'admin_card_already_used_by'.trParams(
                  {'login': email},
                ));
              },
              unauthorized: (_) {});
        },
        (right) async {
          await FlutterNfcKit.finish(
            iosAlertMessage: 'admin_card_associated_to'.trParams(
              {'user': user.title},
            ),
          );

          // Set values
          /*users.value = users.map((elem) {
            if (elem.login == user.login) return elem.copyWith.call(card: right);
            return elem;
          }).toList();*/

          // Close bottomsheet and display success
          Get.back();
          SnackBarUtils.success(
            message: 'admin_card_associated_to'.trParams(
              {'user': user.title},
            ),
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
  Future<void> removeCard(
      CardGetUsersByFilters$Query$TrombiUserType user) async {
    final Either<BaseFailure, void> failOrSuccess =
        await this.cardRepository.removeCard(user.login);

    failOrSuccess.fold(
      (left) {
        SnackBarUtils.error(message: 'http_common');
      },
      (right) {
        // Set values
        /*users.value = users.map((elem) {
          if (elem.login == user.login) return elem.copyWith.call(card: null);
          return elem;
        }).toList();*/

        // Close bottomsheet and display success
        Get.back();
        SnackBarUtils.success(message: 'admin_card_successfully_deleted'.tr);
      },
    );
  }
}
