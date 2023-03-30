import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_page.dart';
import 'package:healthcare_app_doctor/modules/chat/chat_page.dart';
import 'package:healthcare_app_doctor/modules/home/home_pages.dart';
import 'package:healthcare_app_doctor/modules/main-navigation/main_navigation_controller.dart';
import 'package:healthcare_app_doctor/modules/notification/notification_pages.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_pages.dart';


class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedPage = 0;
  final pages = [
    HomePage(),
    ChatPage(),
    Container(),
    NotificationPage(),
    PersonalPage()
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: [
              HomePage(),
              ChatPage(),
              CalendarPage(),
              NotificationPage(),
              PersonalPage()
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          // unselectedItemColor: Colors.black,
          // selectedItemColor: Colors.redAccent,
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,

          showSelectedLabels: true,
          // showUnselectedLabels: false,
          // type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.white,
          // elevation: 0,
          type: BottomNavigationBarType.fixed,
          // currentIndex: selectedPage,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Color(0xFF757575),
          // onTap: (position) {
          //   setState(() {
          //     selectedPage = position;
          //   });
          // },
          items: [
            _bottomNavigationBarItem(
              icon: Icons.home,
              label: 'Trang chủ',
            ),
            _bottomNavigationBarItem(
              icon: Icons.message,
              label: 'Hội thoại',
            ),
            _bottomNavigationBarItem(
              icon: Icons.local_hospital,
              label: 'Bác sĩ',
            ),
            _bottomNavigationBarItem(
              icon: Icons.notifications,
              label: 'Thông báo',
            ),
            _bottomNavigationBarItem(
              icon: Icons.person,
              label: 'Cá nhân',
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}


//  body: ,
//       bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: selectedPage,
//           fixedColor: Colors.blueAccent,
//           unselectedItemColor: Color(0xFF757575),
//           onTap: (position) {
//             setState(() {
//               selectedPage = position;
//             });
//           },
//           items: [
//             _bottomNavigationBarItem(
//               icon: Icons.home,
//               label: 'Trang chủ',
//             ),
//             _bottomNavigationBarItem(
//               icon: Icons.message,
//               label: 'Hội thoại',
//             ),
//             _bottomNavigationBarItem(
//               icon: Icons.local_hospital,
//               label: 'Bác sĩ',
//             ),
//             _bottomNavigationBarItem(
//               icon: Icons.person,
//               label: 'Cá nhân',
//             ),
//           ]),