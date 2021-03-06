import 'package:basic_utils/basic_utils.dart';
import 'package:dashtech/application/activity/activity_controller.dart';
import 'package:dashtech/domain/planning/models/planning_activity.dart';
import 'package:dashtech/presentation/pages/activity/widgets/multiple/multiple_event_activity.dart';
import 'package:dashtech/presentation/pages/activity/widgets/single/activity_assistants_list.dart';
import 'package:dashtech/presentation/pages/activity/widgets/single/activity_top_card.dart';
import 'package:dashtech/presentation/pages/activity/widgets/single/single_event_activity.dart';
import 'package:dashtech/presentation/shared/activity_color_utils.dart';
import 'package:dashtech/presentation/shared/auth_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:dashtech/application/dashboard/dashboard_controller.dart';
import 'package:dashtech/presentation/core/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shimmer/shimmer.dart';

class ActivityDetailsContent extends GetView<ActivityController> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: controller.activity.value.nb_planified <= 1,
      child: SingleEventActivity(),
      replacement: MultipleEventActivity(),
    );
  }
}
