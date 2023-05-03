import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/modules/notification/notification_controller.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatelessWidget {
  var notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            "Thông báo",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: notificationController.listNotification.length,
            itemBuilder: (context, index) {
              return Slidable(
                // actionPane: SlidableDrawerActionPane(),
                // actionExtentRatio: 0.25,
                child: Obx(() => notificationItem(
                    notificationController.listNotification[index])),
                // secondaryActions: <Widget>[
                //   Container(
                //       height: 60,
                //       color: Colors.grey.shade500,
                //       child: Icon(
                //         Icons.info_outline,
                //         color: Colors.white,
                //       )),
                //   Container(
                //       height: 60,
                //       color: Colors.red,
                //       child: Icon(
                //         Icons.delete_outline_sharp,
                //         color: Colors.white,
                //       )),
                // ],
              );
            }));
  }

  notificationItem(DataNotificationResponse notification) {
    DateTime? date = notification.createdAt;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: Icon(
                Icons.notifications,
                size: 25,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      notification.title ?? '',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // in đậm văn bản
                        fontSize: 18.0, // phóng to văn bản
                      ),
                      textAlign: TextAlign.center, // canh giữa văn bản
                      overflow: TextOverflow
                          .ellipsis, // hiển thị ... khi văn bản vượt quá phạm vi
                      maxLines: 2, // giới hạn số dòng của văn bản
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(notification.content ?? ''),
                    const SizedBox(
                      height: 8,
                    ),
                    notification.typeNotification == "EMERGENCY"
                        ? GestureDetector(
                            onTap: () async {
                              if (await canLaunch(notification.url ??
                                  "https://www.google.com/maps/search/?api=1&query=10.8225079,106.6880955")) {
                                await launch(notification.url ??
                                    "https://www.google.com/maps/search/?api=1&query=10.8225079,106.6880955");
                              } else {
                                throw 'Could not launch ';
                              }
                            },
                            child: Text("Địa chỉ cấp cứu"))
                        : const SizedBox(),
                    Align(
                      alignment:
                          Alignment.bottomRight, // hoặc Alignment.bottomRight
                      child: Text(
                        inputFormat,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
