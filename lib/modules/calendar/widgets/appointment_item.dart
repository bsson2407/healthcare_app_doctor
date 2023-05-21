import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/calendar/calendar_controller.dart';
import 'package:healthcare_app_doctor/modules/calendar/widgets/appointment_dialog.dart';
// import 'avatar_image.dart';
import 'package:intl/intl.dart';

class AppointmentItem extends StatelessWidget {
  AppointmentItem(this.data, {Key? key, this.onTap}) : super(key: key);
  final calendarController = Get.find<CalendarController>();

  final data;
  final GestureTapCallback? onTap;
  // final direction = AppState.of(context)!.direction;
  @override
  Widget build(BuildContext context) {
    DateTime? date = data?.dateMeeting;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    String timeMeeting = data?.timeMeeting;
    String? time = '$inputFormat + $timeMeeting';
    String appointmentStatus = '';
    Color? colorStatus = Colors.white;

    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) => AppointmentDialog(
                  data: data,
                ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          // borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Slidable(
          // key: const ValueKey(1),
          groupTag: '0',
          // direction: direction,
          startActionPane: ActionPane(
            openThreshold: 0.1,
            closeThreshold: 0.4,
            motion: BehindMotion(),
            children: [
              SlidableAction(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                icon: Icons.check,
                onPressed: (_) {
                  calendarController.approveAppointment(data?.id);
                },
              ),
              SlidableAction(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                onPressed: (_) {
                  calendarController.refuseAppointment(data?.id);
                },
              )
            ],
          ),

          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                        child: Container(
                            height: 60,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Container(
                                            child: Text(data?.fullName,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)))),
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 20,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 13,
                                        vertical: 3,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: colorStatus,
                                      ),
                                      child: Text(
                                        appointmentStatus,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontSize: 11, color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                        child: Text(time,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 13,
                                                color: Colors.grey))),
                                  ],
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(data?.notes,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 13))),
                                  ],
                                ),
                              ],
                            ))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
