import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';

class MainNavigatorPage extends StatefulWidget {
  State<StatefulWidget> createState() => _MainNavigatorPage();
}

class _MainNavigatorPage extends State<MainNavigatorPage> with SingleTickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  final iconList = <IconData>[
    Icons.home,
    Icons.calendar_today,
    Icons.notifications_active,
    Icons.settings,
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xffF4F4F4),
          extendBody: true,
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Icons.power_settings_new),
                onPressed: () {},
                color: Colors.white,
              )
            ],
            leading: IconButton(
              icon: Icon(Icons.traffic),
              onPressed: () {},
              color: Color(0xff00a152),
            ),
            title: SvgPicture.asset(
              AssetsUtils.svg('logo_line_1'),
              width: MediaQuery.of(context).size.width / 3,
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            bottom: TabBar(
              labelColor: Theme.of(context).primaryColor,
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                color: Color(0xFFF4F4F4),
              ),
              tabs: [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Activités".toUpperCase()),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Modules".toUpperCase()),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Projets".toUpperCase()),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: ScaleTransition(
            scale: animation,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: Color(0xff2979ff),
              tooltip: "Absences",
              child: Icon(
                Icons.playlist_add_check,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: iconList,
            backgroundColor: Theme.of(context).primaryColor,
            activeIndex: _bottomNavIndex,
            activeColor: Colors.white,
            splashColor: Color(0xff2196f3),
            inactiveColor: Colors.white70,
            notchAndCornersAnimation: animation,
            splashSpeedInMilliseconds: 300,
            notchSmoothness: NotchSmoothness.defaultEdge,
            gapLocation: GapLocation.center,
            leftCornerRadius: 25,
            rightCornerRadius: 25,
            onTap: (index) => setState(() => _bottomNavIndex = index),
          ),
          body: TabBarView(children: [
            Icon(Icons.apps),
            Icon(Icons.movie),
            Icon(Icons.games),
          ]),
        ));
  }
}
