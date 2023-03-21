import 'package:get/get.dart';
import 'package:healthcare_app_doctor/models/notifications/notification_response.dart';
import 'package:healthcare_app_doctor/repository/appointment.repository.dart';

class NotificationController extends GetxController {
  final appointmentRepository = Get.find<AppointmentRepository>();
  RxList<DataNotificationResponse> listNotification =
      RxList<DataNotificationResponse>([]);

  @override
  void onInit() {
    super.onInit();

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
