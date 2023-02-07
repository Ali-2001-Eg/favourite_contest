import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basic/animated_bottom_navbar/dashboard/dashboard_controller.dart';
import 'package:getx_basic/animated_bottom_navbar/home/home_page.dart';

import '../add/add_page.dart';
import '../custom_animated_navbar.dart';
import '../messages/messages_page.dart';
import '../user/users_page.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int _currentIndex = 0;

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_controller) {
        return Scaffold(
            body: SafeArea(
              child: IndexedStack(
                index: _controller.tapIndex,
                children: [
                  HomePage(),
                  UsersPage(),
                  MessagesPage(),
                  AddPage(),
                ],
              ),
            ),
            bottomNavigationBar: _buildBottomBar());
      },
    );
  }

  Widget _buildBottomBar() {
    return GetBuilder<DashboardController>(builder: (_controller) {
      return CustomAnimatedBottomBar(
        containerHeight: 70,
        backgroundColor: Colors.white,
        selectedIndex: _controller.tapIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected:_controller.changeTapIndex,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: Colors.green,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Users'),
            activeColor: Colors.purpleAccent,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.message),
            title: const Text(
              'Messages ',
            ),
            activeColor: Colors.pink,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: Colors.blue,
            inactiveColor: _inactiveColor,
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }

  Widget getBody() {
    List<Widget> pages = <Widget>[
      HomePage(),
      UsersPage(),
      MessagesPage(),
       AddPage(),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }
}
