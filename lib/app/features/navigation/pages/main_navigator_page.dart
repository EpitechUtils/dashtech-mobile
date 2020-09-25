import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/pages/dash_initial_page.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainNavigatorPage extends StatefulWidget {
  State<StatefulWidget> createState() => _MainNavigatorPage();
}

class _MainNavigatorPage extends State<MainNavigatorPage> with TickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of first screen

  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

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
    return Scaffold(
      backgroundColor: Color(0xffF4F4F4),
      extendBody: true,
      appBar: _buildAppBar(),
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
        icons: [Icons.home, Icons.calendar_today, Icons.notifications_active, Icons.settings],
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
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) => state.when(
          home: (e) => DashInitialPage(),
          planning: (e) => Container(),
          notifications: (e) => Container(),
          settings: (e) => Container(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
    );
  }
}
