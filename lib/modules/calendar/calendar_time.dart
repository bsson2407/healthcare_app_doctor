import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_controller.dart';
import 'package:healthcare_app_doctor/modules/calendar/models/decoration_item.dart';
import 'package:healthcare_app_doctor/modules/calendar/widgets/appointment_info.dart';
import 'package:healthcare_app_doctor/modules/calendar/widgets/calendar_week.dart';
import 'package:intl/intl.dart';

class CalendarTime extends StatefulWidget {
  CalendarTime({Key? key}) : super(key: key);

  @override
  _CalendarTimeState createState() => _CalendarTimeState();
}

class _CalendarTimeState extends State<CalendarTime> {
  bool isFirst = true;
  final calendarController = Get.find<CalendarController>();

  final CalendarWeekController _controller = CalendarWeekController();
  @override
  Widget build(BuildContext context) {
    if (isFirst) {
      calendarController.initListAppointment("APPROVED", DateTime.now());
      isFirst = false;
    }
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.jumpToDate(DateTime.now());

          setState(() {});
        },
        child: Icon(Icons.today),
      ),
      body: Column(children: [
        Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 1)
            ]),
            child: CalendarWeek(
              controller: _controller,
              height: 100,
              showMonth: true,
              minDate: DateTime.now().add(
                Duration(days: -365),
              ),
              maxDate: DateTime.now().add(
                Duration(days: 365),
              ),
              onDatePressed: (DateTime datetime) {
                // Do something
                calendarController.initListAppointment('APPROVED', datetime);
                setState(() {});
              },
              onDateLongPressed: (DateTime datetime) {
                // Do something
              },
              onWeekChanged: () {
                // Do something
              },
              monthViewBuilder: (DateTime time) => Align(
                alignment: FractionalOffset.center,
                child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      DateFormat.yMMMM().format(time),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    )),
              ),
              decorations: [
                DecorationItem(
                    decorationAlignment: FractionalOffset.bottomRight,
                    date: DateTime.now(),
                    decoration: Icon(
                      Icons.today,
                      color: Colors.blue,
                    )),
              ],
            )),
        SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: getAppointmentList()))
      ]),
    );
  }

  getAppointmentList() {
    return Obx(() => Column(
        children: List.generate(
            calendarController.listAppointment.length,
            (index) =>
                AppointmentInfo(calendarController.listAppointment[index]))));
  }
}
