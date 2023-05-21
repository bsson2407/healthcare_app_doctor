import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/repository/appointment.repository.dart';
import 'package:healthcare_app_doctor/service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class NotificationController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  RxList<DataNotificationResponse> listNotification =
      RxList<DataNotificationResponse>([]);

  RxList<DataNotificationResponse> listNotificationNotRead =
      RxList<DataNotificationResponse>([]);
  var socketService = Get.find<SocketService>();
  RxBool isNoti = false.obs;
  RxString content = "".obs;
  RxString url = "".obs;
  RxInt page = 1.obs;
  final ScrollController scrollController = ScrollController();
  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(_scrollListener);
    socketService.socket.onConnect((data) {
      socketService.socket.on('newNotification', (msg) {
        // MessageResponse msga = msg;
        try {
          DataNotificationResponse messageResponse =
              DataNotificationResponse.fromJson(msg['data']);
          // initListNotification();
          listNotification.insert(0, messageResponse);

          listNotificationNotRead.add(messageResponse);
          // isNoti.value = true;

          if (messageResponse.typeNotification == "EMERGENCY") {
            content.value = messageResponse.content!;
            url.value = messageResponse.url!;

            Get.snackbar("Cấp cứu", messageResponse.content!);

            //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: TextWidget(
            //     label: error.toString(),
            //   ),
            //   backgroundColor: Colors.red,
            // ));
          }
        } catch (e) {}
      });
    });
    initListNotification(page.value);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      initListNotification(page.value++);
    }
  }

  void readAll() {
    appointmentRepository
        .readAllNotification()
        .then((value) => listNotificationNotRead.clear());
  }

  // void isRead() {
  //   isNoti.value = false;
  // }

  void initListNotification(int page) async {
    final response = await appointmentRepository.getNotification(page);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      if (page > 1) {
        listNotification.addAll(response.data);
      } else {
        listNotification.clear();
        listNotification.addAll(response.data);
      }
    } else {
      // Xử lý khi API trả về lỗi
    }
    print("listNotification.length:${listNotification.length}");
    for (var i = 0; i < listNotification.length; i++) {
      print("listNotification.isRead:${listNotification[i].isRead}");

      if (listNotification[i].isRead == false) {
        listNotificationNotRead.add(listNotification[i]);
      }
    }
  }
}
