import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:epitech_intranet_mobile/app/core/utils/assets_utils.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth/auth_event.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/auth/bloc/auth_mode/auth_mode_event.dart';
import 'package:epitech_intranet_mobile/app/features/dashboard/pages/dash_initial_page.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_bloc.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_event.dart';
import 'package:epitech_intranet_mobile/app/features/navigation/bloc/navigation_state.dart';
import 'package:epitech_intranet_mobile/app/features/notification/pages/notifications_page.dart';
import 'package:epitech_intranet_mobile/app/features/setting/pages/settings_page.dart';
import 'package:epitech_intranet_mobile/app/shared/widgets/comming_soon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainNavigatorPage extends StatefulWidget {
  State<StatefulWidget> createState() => _MainNavigatorPage();
}

class _MainNavigatorPage extends State<MainNavigatorPage> with TickerProviderStateMixin {
  final List<NavigationEvent> bottomNavEvents = [
    NavigationEvent.goHome(),
    NavigationEvent.goPlanning(),
    NavigationEvent.goProfile(),
    NavigationEvent.goSettings(),
  ];

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
            Icons.code,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.calendar_today,
          Icons.person,
          Icons.settings,
        ],
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
        onTap: (index) {
          setState(() => _bottomNavIndex = index);
          BlocProvider.of<NavigationBloc>(context).add(bottomNavEvents[index]);
        },
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) => state.when(
          home: (e) => DashInitialPage(),
          planning: (e) => CommingSoonWidget(),
          notifications: (e) => NotificationsPage(),
          settings: (e) => SettingsPage(),
          profile: (e) => CommingSoonWidget(),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      actions: [
        IconButton(
          icon: Stack(
            children: <Widget>[
              Icon(Icons.notifications),
              Positioned(
                right: 0,
                child: new Container(
                  padding: EdgeInsets.all(1),
                  decoration: new BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: new Text(
                    '13',
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
          onPressed: () {
            setState(() => _bottomNavIndex = -1);
            BlocProvider.of<NavigationBloc>(context).add(NavigationEvent.goNotifications());
          },
          color: Colors.white,
        )
      ],
      leading: IconButton(
        icon: Icon(Icons.favorite),
        color: Colors.redAccent,
        onPressed: () {
          BlocProvider.of<AuthBloc>(context).add(AuthEvent.logout());
          BlocProvider.of<AuthModeBloc>(context).add(AuthModeEvent.showSigninForm());
        },
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
