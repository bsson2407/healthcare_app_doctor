import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_list.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_time.dart';

import 'package:healthcare_app_doctor/widgets/tabbar_widget.dart';

class CalendarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Thông tin cuộc hẹn',
        tabs: const [
          Tab(icon: Icon(Icons.calendar_view_day), text: 'Cuộc hẹn'),
          Tab(icon: Icon(Icons.calendar_today), text: 'Lịch'),
        ],
        children: [
          CalendarList(),
          CalendarTime(),
        ],
      );
}
