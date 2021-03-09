import 'package:dashtech/application/activity/appointment_controller.dart';
import 'package:dashtech/domain/planning/models/activity_details.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/core/utils/assets_utils.dart';
import 'package:dashtech/presentation/shared/cached_circle_avatar.dart';
import 'package:dashtech/presentation/shared/get_view_with_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class AvailableSlotsList extends GetViewWithHook<AppointmentController> {
  AvailableSlotsList({this.event});

  final ActivityDetailsEvent event;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      controller.changeSlotBlocByEvent(event);
      return () => null;
    }, []);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          "appointment_slot_list".tr,
          style: Get.textTheme.headline1,
        ),
        Text(
          'select_appointment_slot'.tr,
          style: Get.textTheme.headline2,
        ),
        const SizedBox(height: 10),
        Obx(
          () => Visibility(
            visible: controller.isLoading.value,
            child: Container(),
            replacement: Visibility(
              visible: controller.getSlotsForEventCode(event.code).isNotEmpty,
              replacement: Card(
                color: Color(warnColor),
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: Get.width - 20,
                  child: Text(
                    'no_slot_available'.tr,
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headline2.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              child: Column(
                children: controller
                    .getSlotsForEventCode(event.code)
                    .map(
                      (slot) => Slidable(
                        actionPane: SlidableBehindActionPane(),
                        secondaryActions: [
                          FlatButton(
                            color: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.zero,
                            height: 50,
                            splashColor: Color(greyColor).withOpacity(0.2),
                            onPressed: () {},
                            child: Icon(
                              Icons.add,
                              color: Colors.green,
                            ),
                          ),
                        ],
                        child: Card(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 4,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            width: Get.width - 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: slot.code != null
                                          ? CachedCircleAvatar(
                                              noPicture: Image.asset(
                                                AssetsUtils.image(
                                                    'unknown', FileFormat.jpg),
                                                width: 30,
                                              ),
                                              imagePath:
                                                  AssetsUtils.profilePicture(
                                                      slot.master.login
                                                          .split('@')
                                                          .first),
                                              radius: 30,
                                            )
                                          : Icon(
                                              Icons.lock_open_outlined,
                                              color: Color(textColor),
                                              size: 30,
                                            ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "De " +
                                                controller.activityController
                                                    .parseActivityTime(
                                                        slot.date) +
                                                " à " +
                                                controller.activityController
                                                    .parseActivityTime(
                                                  slot.date,
                                                  addMinutes: slot.duration,
                                                ),
                                            style: Get.textTheme.headline2
                                                .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            slot.master != null
                                                ? slot.master.login +
                                                    ", +" +
                                                    slot.members.length
                                                        .toString()
                                                : "Libre",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Get.textTheme.headline2,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                slot.code != null &&
                                        controller.appointmentDetails.value
                                                .group !=
                                            null &&
                                        slot.code ==
                                            controller.appointmentDetails.value
                                                .group.code
                                    ? Container(
                                        margin: const EdgeInsets.only(top: 5),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle_outline,
                                              color: Color(successColor),
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "registered_to_this_slot".tr,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Get.textTheme.headline2
                                                  .copyWith(
                                                fontStyle: FontStyle.italic,
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
