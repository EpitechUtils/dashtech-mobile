import 'package:dashtech/application/admin/card/admin_card_controller.dart';
import 'package:dashtech/domain/card/models/trombi_user.dart';
import 'package:dashtech/infrastructure/core/graphql/graphql_api.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/bottomsheet_card_history.dart';
import 'package:dashtech/presentation/pages/admin/card/widgets/user/bottomsheet_card_info.dart';
import 'package:dashtech/presentation/shared/get_view_with_hook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class TrombiUserBottomSheet extends GetViewWithHook<AdminCardController> {
  final CardGetUsersByFilters$Query$TrombiUser user;

  TrombiUserBottomSheet(this.user);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      controller.getUserCardHistory(user);
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
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: TabBarView(
          children: [
            BottomSheetCardInfo(user),
            BottomSheetCardHistory(user),
          ],
        ),
      ),
    );
  }
}
