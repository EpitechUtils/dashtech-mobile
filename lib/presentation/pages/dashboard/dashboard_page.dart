import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_store/application/dashboard/dashboard_controller.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/pages/dashboard/widgets/dashboard_search_sliver_bar.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(fillColor),
      body: DashboardSearchSliverBar(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(bottom: 15),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(),
              ),
            ),
          ),
          /*SliverToBoxAdapter(
            child: FadeInRight(
              duration: const Duration(milliseconds: 600),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: BalanceCard(),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 15),
            sliver: DashboardSliverTitle(
              title: 'dashboard_services_title'.tr,
              subtitle: 'dashboard_services_subtitle'.tr,
            ),
          ),
          SliverToBoxAdapter(
            child: FadeInLeft(
              child: const ServicesHorizontalList(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 15),
            sliver: DashboardSliverTitle(
              title: 'dashboard_therapist_title'.tr,
              subtitle: 'dashboard_therapist_subtitle'.tr,
            ),
          ),
          Obx(
            () => DashboardSliverList(
              pagingController: controller.pagingController.value,
            ),
          ),*/
        ],
      ),
    );
  }
}
