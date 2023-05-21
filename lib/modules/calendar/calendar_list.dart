import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_controller.dart';
import 'package:healthcare_app_doctor/modules/calendar/widgets/appointment_item.dart';

class CalendarList extends StatelessWidget {
  final calendarController = Get.find<CalendarController>();
  String dropdownValue = 'Tất cả';
  @override
  Widget build(BuildContext context) {
    calendarController.initListAppointment("CREATED", null);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => calendarController.refreshListAppointment(),
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: getAppointmentList())),
      ),
    );
  }

  getAppointmentList() {
    return Obx(() => Column(
        children: List.generate(
            calendarController.listAppointment.length,
            (index) =>
                AppointmentItem(calendarController.listAppointment[index]))));
  }
}
