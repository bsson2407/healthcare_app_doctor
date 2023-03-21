import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/heartbeat/heartbeat_controller.dart';

class HeartbeatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HeartbeatController());
  }
}
