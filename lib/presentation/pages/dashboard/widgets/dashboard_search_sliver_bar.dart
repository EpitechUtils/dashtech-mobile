import 'package:flutter/material.dart';
import 'package:flutter_file_store/application/dashboard/dashboard_controller.dart';
import 'package:flutter_file_store/presentation/core/theme/app_colors.dart';
import 'package:flutter_file_store/presentation/core/utils/keyboard_utils.dart';
import 'package:get/get.dart';

class DashboardSearchSliverBar extends StatelessWidget {
  DashboardSearchSliverBar({
    @required this.slivers,
    this.key,
  }) : super(key: key);

  final DashboardController dashboardController = Get.find();

  final List<Widget> slivers;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => KeyboardUtils.hide(context),
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 100,
              collapsedHeight: 73,
              toolbarHeight: 72,
              shape: const CurvedShape(),
              automaticallyImplyLeading: false,
              pinned: true,
              centerTitle: false,
              floating: true,
              // ignore: prefer_const_literals_to_create_immutables
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 25.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cinepassion34.fr/wp-content/uploads/2017/07/Chuck-Norris-cinepassion34.jpg',
                      ),
                      radius: 27,
                    ),
                  ),
                ),
              ],
              title: Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 10,
                  top: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Salut à toi Cyril !',
                      style: Get.textTheme.headline1.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Comment ça va bien ?',
                      style: Get.textTheme.subtitle2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: const Color(primaryColor),
              elevation: 0,
            ),
          ];
        },
        body: SafeArea(
          bottom: false,
          minimum: const EdgeInsets.only(top: 50),
          child: Builder(
            builder: (BuildContext context) {
              return CustomScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                slivers: slivers,
              );
            },
          ),
        ),
      ),
    );
  }
}

class CurvedShape extends ContinuousRectangleBorder {
  const CurvedShape();

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    final double ratio = rect.size.height <= 120.0 ? 0.0 : (32.0 * 2.0);
    return Path()
      ..lineTo(0, rect.size.height)
      ..quadraticBezierTo(
        rect.size.width / 2,
        rect.size.height + ratio,
        rect.size.width,
        rect.size.height,
      )
      ..lineTo(rect.size.width, 0);
  }
}
