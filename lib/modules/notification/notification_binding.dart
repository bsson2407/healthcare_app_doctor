import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/notification/notification_controller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
