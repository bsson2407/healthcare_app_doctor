import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/messages/messages_controller.dart';

class MessagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessagesController());
  }
}
