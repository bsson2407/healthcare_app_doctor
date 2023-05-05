import 'package:get/get.dart';
import 'package:healthcare_app_doctor/modules/otp/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController());
  }
}
