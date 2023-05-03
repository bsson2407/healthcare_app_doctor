import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/repository/appointment.repository.dart';
import 'package:healthcare_app_doctor/service/socket_service.dart';
import 'package:socket_io_client/socket_io_client.dart';

class NotificationController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  RxList<DataNotificationResponse> listNotification =
      RxList<DataNotificationResponse>([]);
  var socketService = Get.find<SocketService>();

  @override
  void onInit() {
    super.onInit();
    socketService.socket.onConnect((data) {
      socketService.socket.on('newNotification', (msg) {
        // MessageResponse msga = msg;
        try {
          DataNotificationResponse messageResponse =
              DataNotificationResponse.fromJson(msg['data']);
          // initListNotification();
          listNotification.add(messageResponse);
        } catch (e) {}
      });
    });
    initListNotification();
  }

  void initListNotification() async {
    final response = await appointmentRepository.getNotification(1, 20);

    if (response.statusCode == 200) {
      // listBmi = response.data;
      listNotification.clear();
      listNotification.addAll(response.data);
    } else {
      // Xử lý khi API trả về lỗi
    }
  }
}
