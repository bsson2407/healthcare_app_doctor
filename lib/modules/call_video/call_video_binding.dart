import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/call/call_controller.dart';

class CallVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CallController());
  }
}
