import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/chat/chat_controller.dart';
import 'package:healthcare_app_doctor/modules/home/home_controller.dart';
import 'package:healthcare_app_doctor/modules/main-navigation/main_navigation_controller.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_controller.dart';
import 'package:healthcare_app_doctor/modules/notification/notification_controller.dart';
import 'package:healthcare_app_doctor/modules/personal/personal_controller.dart';


class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainNavigationController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<MessagesController>(() => MessagesController());
    // Get.lazyPut<DoctorController>(() => DoctorController());
    Get.lazyPut<NotificationController>(() => NotificationController());
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
