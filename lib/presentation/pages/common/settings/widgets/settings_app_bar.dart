import 'package:animate_do/animate_do.dart';
import 'package:dashtech/application/common/settings/settings_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SettingsAppBar extends GetView<SettingsController> implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80.0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: [
        Obx(
          () => Visibility(
            visible: controller.needsUpdate.value,
            child: Obx(
              () => Visibility(
                visible: !controller.isUpdating.value,
                child: FadeIn(
                  child: IconButton(
                    icon: Icon(
                      LineIcons.save,
                      color: Colors.white,
                    ),
                    iconSize: 30,
                    splashRadius: 20,
                    onPressed: controller.saveSettings,
                  ),
                ),
                replacement: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
      title: Padding(
        padding: const EdgeInsets.only(
          right: 20,
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "settings_title".tr,
              style: Get.textTheme.headline1!.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "settings_subtitle".tr,
              overflow: TextOverflow.fade,
              style: Get.textTheme.subtitle2!.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(primaryColor),
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}
