import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/modules/notification/notification_controller.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

var notificationController = Get.find<NotificationController>();

class _NotificationPageState extends State<NotificationPage> {
  // List<dynamic> notifications = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                child: notificationItem(
                    notificationController.listNotification[index]),
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
    DateTime? date = notification?.createdAt;
    var inputFormat = DateFormat('dd/MM/yyyy').format(date!);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      notification?.title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // in đậm văn bản
                        fontSize: 18.0, // phóng to văn bản
                      ),
                      textAlign: TextAlign.center, // canh giữa văn bản
                      overflow: TextOverflow
                          .ellipsis, // hiển thị ... khi văn bản vượt quá phạm vi
                      maxLines: 2, // giới hạn số dòng của văn bản
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(notification?.content ?? ''),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment:
                          Alignment.bottomRight, // hoặc Alignment.bottomRight
                      child: Text(
                        inputFormat ?? '',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // notification.postImage != '' ?
          //   Container(
          //     width: 50,
          //     height: 50,
          //     child: ClipRRect(
          //       child: Image.network(notification.postImage)
          //     ),
          //   )
          // : Container(
          //     height: 35,
          //     width: 110,
          //     decoration: BoxDecoration(
          //       color: Colors.blue[700],
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     child: Center(
          //       child: Text('Follow', style: TextStyle(color: Colors.white))
          //     )
          //   ),
        ],
      ),
    );
  }
}
