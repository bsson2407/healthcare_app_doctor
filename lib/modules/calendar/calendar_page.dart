import 'package:flutter/material.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_list.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_time.dart';

import 'package:healthcare_app_doctor/widgets/tabbar_widget.dart';

class CalendarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Thông tin cuộc hẹn',
        tabs: const [
          Tab(icon: Icon(Icons.table_chart), text: 'Thông tin'),
          Tab(icon: Icon(Icons.table_chart), text: 'Bảng'),
        ],
        children: [
          CalendarList(),
          CalendarTime(),
        ],
      );
}
