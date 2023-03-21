import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}
