import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet_card_id.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/trombi_user_bottomsheet_shimmer.dart';
import 'package:dashtech/presentation/shared/get_view_with_hook.dart';
import 'package:dashtech/presentation/shared/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class TrombiUserBottomSheet extends GetViewWithHook<AdminCardController> {
  final TrombiUser user;

  TrombiUserBottomSheet(this.user);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      controller.getUserCardInfo(user);
      return () => null;
    }, []);

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text(
                  user.title,
                  style: TextStyle(
                    color: Color(0xFF131313),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  user.login,
                  style: TextStyle(
                    color: Color(greyColor),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Obx(
            () => Visibility(
              visible: !controller.userCardInfoIsLoading.value,
              replacement: TrombiUserBottomSheetShimmer(),
              child: Expanded(
                child: Column(
                  children: [
                    TrombiUserBottomSheetCardId(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 60,
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 4),
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            splashColor: Color(primaryColor).withOpacity(0.2),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Historique des modifications",
                                    style: Get.textTheme.headline3!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.chevron_right,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: RoundedButton(
                            onPressed: controller.searchForNfcTag,
                            label: 'Associer une carte',
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
